package taven.resource
{
    import taven.dataset.HashMap;
    import taven.log.Console;
    
    import flash.system.ApplicationDomain;
    import flash.utils.clearTimeout;
    import flash.utils.setTimeout;

    /**
     * 资源管理器
     * @author Taven
     */
    public class ResourceManager extends Object
    {
        // 资源缓存
        private static var _resourceCache:ResourceCache = new ResourceCache();

        // 资源保留
        private static var _resourceMap:HashMap = new HashMap();

        // ID
        private static var _id:int = 0;

        private static var _processes:Object = {};

        // 不缓存
        public static const NO_CACHE:int = 0;

        // 缓存
        public static const TEMP_CACHE:int = 1;

        // 持续保留
        public static const PERM_CACHE:int = 2;

        /**
         * 单一加载一个资源
         * @param	url			资源路径
         * @param	complete	加载完成的回调函数
         * @param	progress	加载过程中的回调函数
         * @param	vars		回调函数的参数
         * @param	lazy		资源是否参与缓存：TEMP_CACHE,缓存；NO_CACHE, 不缓存;PERM_CACHE, 持续保留
         * @param	skipError	跳过错误正常回调
         */
        public static function loadFile(url:String, complete:Function, progress:Function = null,
                                        vars:* = null, lazy:int = ResourceManager.TEMP_CACHE,
                                        skipError:Boolean = false):void
        {
            if (lazy == ResourceManager.TEMP_CACHE)
            {
                //缓存
                _resourceCache.find(url, complete, progress, vars, skipError);
            }
            else
            {
                var loader:RESLoader = createLoader(url);
                loader.completeHandler = function(loader:RESLoader):void
                {
                    if (progress != null)
                    {
                        progress(100);
                    }
                    if (complete != null)
                    {
                        if (lazy == ResourceManager.PERM_CACHE)
                        {
                            //持续保留	
                            _resourceMap.add(url, loader.data);
                        }
                        if (vars != null)
                        {
                            complete(loader.data, vars)
                        }
                        else
                        {
                            complete(loader.data);
                        }
                    }
                    loader.destroy();
                };
                loader.progressHandler = progress;
                loader.errorHandler = function(loader:RESLoader):void
                {
                    if (skipError)
                    {
                        loader.completeHandler(loader);
                    }
                    else
                    {
                        Console.write("资源[" + loader.url + "]加载失败");
                    }
                    loader.destroy();
                };
                loader.load(url);

            }

        }

        /**
         * 加载多个文件
         * @param list
         * @param complete
         * @param progress
         * @param vars
         * @param lazy
         * @param skipError	跳过错误正常回调
         */
        public static function loadList(list:Array, complete:Function, progress:Function = null,
                                        vars:* = null, lazy:int = ResourceManager.TEMP_CACHE,
                                        skipError:Boolean = false):void
        {
            var newlist:Array = [];
            if (list)
            {
                for each (var url:String in list)
                {
                    if (url && !_resourceCache.containsKey(url))
                    {
                        newlist.push(url);
                    }
                }
            }

            var args:Object = { complete: complete, progress: progress, vars: vars, lazy: lazy };

            if (newlist.length > 0)
            {
                _id++;
                _processes[_id] = true;
                loadOne(newlist, 0, args, _id, skipError);
            }
            else
            {
                var timeoutId:int = setTimeout(function():void
                {
                    if (args.progress != null)
                    {
                        if (args.progress.length == 1)
                        {
                            args.progress(100);
                        }
                        else if (args.progress.length == 3)
                        {
                            args.progress(1, 1, 100);
                        }
                    }
                    if (args.complete != null)
                    {
                        if (args.vars != null)
                        {
                            args.complete(args.vars);
                        }
                        else
                        {
                            args.complete();
                        }
                    }
                    clearTimeout(timeoutId);
                }, 10);
            }
        }

        /**
         * 批量加载资源会调用的一个个队列加载
         * @param list
         * @param index
         * @param args
         * @param id
         * @param skipError	跳过错误正常回调
         */
        private static function loadOne(list:Array, index:int, args:Object, id:int = 0,
                                        skipError:Boolean = false):void
        {
            var len:int = list.length;
            var url:String = list[index];

            var loader:RESLoader = createLoader(url);
            loader.completeHandler = function(loader:RESLoader):void
            {
                if (args.lazy == ResourceManager.TEMP_CACHE)
                {
                    // 缓存
                    _resourceCache.put(loader.url, loader.data);
                }
                else if (args.lazy == ResourceManager.PERM_CACHE)
                {
                    // 保留
                    _resourceMap.add(loader.url, loader.data);
                }

                if (_processes[id] == false)
                {
                    delete _processes[id];
                    return;
                }
                if ((index + 1) >= len)
                {
                    delete _processes[id];

                    if (args.progress != null)
                    {
                        if (args.progress.length == 1)
                        {
                            args.progress(100);
                        }
                        else if (args.progress.length == 3)
                        {
                            args.progress(index + 1, len, 100);
                        }
                    }

                    if (args.vars)
                    {
                        args.complete(args.vars);
                    }
                    else
                    {
                        args.complete();
                    }
                }
                else
                {
                    loadOne(list, (index + 1), args, id, skipError);
                }
                loader.destroy();
            };

            loader.progressHandler = function(percent:int):void
            {
                if (args.progress != null)
                {
                    if (args.progress.length == 1)
                    {
                        args.progress(((index * 100 + percent) / (len * 100)) * 100);
                    }
                    else if (args.progress.length == 3)
                    {
                        args.progress(index, len, percent);
                    }
                }
            };

            loader.errorHandler = function(loader:RESLoader):void
            {
                if (skipError)
                {
                    loader.completeHandler(loader);
                }
                else
                {
                    Console.write("资源[" + loader.url + "]加载失败");
                }
                loader.destroy();
            };

            loader.load(url);
        }

        /**
         * 手动移除持续保留的资源
         * @param url 资源路径
         *
         */
        public static function removeResource(url:String):void
        {
            if (_resourceMap.containsKey(url))
            {
                _resourceMap.remove(url);
            }
        }

        /**
         *手动移除持续保留的资源数组
         * @param urls 资源路径数组
         *
         */
        public static function removeResources(urls:Array):void
        {
            for each (var url:String in urls)
            {
                removeResource(url);
            }
        }

        /**
         * 通过URL创建对应的加载类
         * @param	url
         * @return
         */
        public static function createLoader(url:String):RESLoader
        {
            var symbolpos:int = url.lastIndexOf("/");
            var argpos:int = url.indexOf("?");
            var file:String = url.substring(symbolpos + 1, argpos != -1 ? argpos : int.MAX_VALUE);
            var extension:String = file.substring(file.lastIndexOf(".") + 1).toLowerCase();
            switch (extension)
            {
                case "swf":
                case "png":
                case "jpg":
                {
                    return new SWFLoader();
                }
                case "zip":
                case "bin":
                {
                    return new DataLoader();
                }
                case "xml":
                case "csv":
                {
                    return new TextLoader();
                }
            }
            throw new Error("未定义的文件类型: " + url);
            return null;
        }

        /**
         * 获取资源
         * @param	url	资源路径
         * @return	返回资源
         */
        public static function fetch(url:String):*
        {
            if (_resourceMap.containsKey(url))
            {
                return _resourceMap.getValue(url);
            }
            return _resourceCache.fetch(url);
        }

        /**
         * 查找是否存在资源
         * @param	url	资源路径
         * @return	返回资源是否存在
         */
        public static function has(url:String):Boolean
        {
            if (!_resourceMap.containsKey(url) && !_resourceCache.containsKey(url))
            {
                return false;
            }
            return true;
        }

        /**
         * 获取类
         * @param className
         * @param url
         * @return
         *
         */
        public static function getClass(className:String, url:String = ""):Class
        {
            var domain:ApplicationDomain = ApplicationDomain.currentDomain;
            if (url && _resourceMap.containsKey(url))
            {
                domain = _resourceMap.getValue(url).loaderInfo.applicationDomain;
            }
            else if (url && _resourceCache.containsKey(url))
            {
                domain = _resourceCache.fetch(url).loaderInfo.applicationDomain;
            }

            if (domain.hasDefinition(className))
            {
                return domain.getDefinition(className) as Class;
            }
            return null;
        }

        /**
         * 获取实例化的对象
         * @param	className
         * @param	url
         * @return
         */
        public static function getObject(className:String, url:String = ""):Object
        {
            var objectClass:Class = getClass(className, url);
            if (objectClass)
            {
                return new objectClass();
            }
            return null;
        }
    }
}
