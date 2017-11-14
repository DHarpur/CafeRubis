class Product{
  
  //Class variables
  String name;
  float price;
  
  //Constructor which reads in a TableRow
  Product(TableRow row){
    this.name = row.getString("Name");
    this.price = row.getFloat("Price");
  }
  
  //ToString Function
  String toString()
  {
    return name + "\t €" + nf(price, 0, 2);
  }
}