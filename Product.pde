class Product{
  
  String name;
  float price;
  
  Product(TableRow row){
    this.name = row.getString("Name");
    this.price = row.getFloat("Price");
  }
}