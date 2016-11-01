package taven.resource
{
    import taven.dataset.HashMap;
    import taven.log.Console;

    /**
     * 资源缓存
     * @author Alex
     */
    public class ResourceCache
    {
        // 最大缓存容量
        private var _max_size:uint;

        private var _resourceMap:Array;

        public function ResourceCache(size:int = 100)
        {
			_resourceMap = [];
            _max_size = size;
        }

        public function get max_size():uint
        {
            return _max_size;
        }

        public function set max_size(value:uint):void
        {
            _max_size = value;
        }

        private function update(key:String):void
        {
            var index:int = getItemIndex(key);
            if (index >= 0)
            {
                var item:ResourceItem = _resourceMap[index];
                _resourceMap.splice(index, 1);
                _resourceMap.push(item);
            }
        }

        /**
         * 通过Key获取资源
         * @param key
         * @return
         */
        private function getItem(key:String):ResourceItem
        {
            for each (var item:ResourceItem in _resourceMap)
            {
                if (item.key == key)
                {
                    return item;
                }
            }
            return null;
        }

        private function getItemIndex(key:String):int
        {
            for (var i:int = 0; i < _resourceMap.length; i++)
            {
                var item:ResourceItem = _resourceMap[i];
                if (item.key == key)
                {
                    return i;
                }
            }
            return -1;
        }

        /**
         * 如果缓存中有该资源，则直接处理；若没有,则由缓存负责加载
         * @param key
         * @param complete
         * @param progress
         * @param vars
         */
        public function find(key:String, complete:Function, progress:Function = null, vars:* = null,
                             skipError:Boolean = false):void
        {
            var item:ResourceItem = getItem(key);
            if (item)
            {
                update(key);
                if (progress != null)
                {
                    progress(1);
                }
                if (complete != null)
                {
                    if (vars != null)
                    {
                        complete(item.data, vars);
                    }
                    else
                    {
                        complete(item.data);
                    }
                }
            }
            else
            {
                load(key, complete, progress, vars, skipError);
            }
        }

        /**
         * 如果缓存中有该资源，则直接处理；没有则由缓存负责加载
         * @param key
         * @param complete
         * @param progress
         * @param vars
         */
        public function load(key:String, complete:Function, progress:Function = null, vars:* = null,
                             skipError:Boolean = false):void
        {
            var loader:RESLoader = ResourceManager.createLoader(key);
            loader.completeHandler = function(loader:RESLoader):void
            {
                if (progress != null)
                {
                    progress(100);
                }
                if (complete != null)
                {
                    put(key, loader.data);
                    if (vars != null)
                    {
                        complete(loader.data, vars);
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
            loader.load(key);
        }

        /**
         * 加入资源
         * @param key
         * @param data
         */
        public function put(key:String, data:*):void
        {
            // 超出缓存容量，则从hashmap和list中删除最少使用的项
            if (_resourceMap.length > max_size)
            {
                var item:ResourceItem = _resourceMap.shift() as ResourceItem;
            }
            _resourceMap.push(new ResourceItem(key, data));
        }

        /**
         * 删除对应key的资源项
         * @param key
         */
        public function remove(key:String):void
        {
            var index:int = getItemIndex(key);
            if (index >= 0)
            {
                _resourceMap.splice(index, 1);
            }
        }

        /**
         * 查找资源中是否包含key对应的资源
         * @param key 资源路径作为key
         */
        public function containsKey(key:String):Boolean
        {
            return getItem(key) != null;
        }

        /**
         * 直接获取资源
         * @param key
         * @return
         */
        public function fetch(key:String):*
        {
            var item:ResourceItem = getItem(key);
            if (item)
            {
                update(key);
                return item.data;
            }
            return null;
        }
    }
}
