enum QueryItems{quantity}

extension QueryItemsExtension on QueryItems{
  MapEntry<String,String> toMapEntry(String value){
    switch(this){
      case QueryItems.quantity :
        return MapEntry('_quantity',value);
    }

  }
}