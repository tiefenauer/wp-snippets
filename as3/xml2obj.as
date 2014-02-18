package info.tiefenauer.globalfunctions
{
    /**
     * Convert XML to Object
     */
    public function xml2obj(xml:XML):Object{
        var obj:Object = new Object();
        var arr:Array = new Array();
 
        var add:Function = function(key:String, item:*):void{
            if (!isNaN(Number(key))){
                arr.push(item);
            }
            else{
                obj[key] = item;
            }
        }
 
        for each(var node:XML in xml.children()){
            var key:String = node.localName();
            if( node.hasComplexContent()){
                add(key, xml2obj(node));
            }
            else{
                var value:String = String(node.text());
                if (isNaN(parseInt(value))){
                    if (isNaN(Number(value)))
                        add(key, value);
                }
                else{
                    add(key, parseInt(value));
                }
 
            }
        }
        if (arr.length > 0)
            return arr;
        return obj;
    }
}