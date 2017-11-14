void setup()
{
  size(800, 600);
  loadData();
  printProducts();
}
ArrayList<Product> products = new ArrayList<Product>();
ArrayList<Product> bill = new ArrayList<Product>();

void draw()
{
  
}

void loadData()
{ 
  Table data = loadTable("cafe.csv", "header");
  for(TableRow row:data.rows())
  {
    Product p = new Product(row);
    products.add(p);
  }
}

void printProducts()
{
  for(Product p:products)
  {
    println(p.toString());
  }
}