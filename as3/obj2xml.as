package info.tiefenauer.globalfunctions
{
    /**
     * Convert an Object to XML
     */
    public function obj2xml(name:String, obj:Object):XML{
        var xml:XML = <{name}/>;
        for (var key:String in obj){
            var value:* = obj[key];
            if (value is String || value is int || value is Number || value is Boolean){
                xml.appendChild(<{key}>{value});
            }
            else if (value is Array){
                var arr:Array = value as Array;
                var node:XML =<{key}/>;
                var list:XMLList = new XMLList();
                for (var i:int=0; i<arr.length;i++)
                    list[i] = <{i}>{arr[i]};
                node.appendChild(list);
                xml.appendChild(node);
            }
            else{
                xml.appendChild(obj2xml(key, value));
            }
        }
        return xml;
    }
}