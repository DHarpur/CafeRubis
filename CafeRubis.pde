void setup()
{
  size(800, 600);
  loadData();
}
ArrayList<Product> products = new ArrayList<Product>();

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