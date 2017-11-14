void setup()
{
  size(800, 600);
  loadData();
  printProducts();
  background(150);
  stroke(0);
  textSize(32);
}
ArrayList<Product> products = new ArrayList<Product>();
ArrayList<Product> bill = new ArrayList<Product>();
String title = "Cafe Rubis Till System";
void draw()
{
  textSize(32);
  fill(0);
  text(title, width/3.5, 50);
  displayProducts();
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

void displayProducts()
{
  float x = 25;
  float y = 75;
  float rectWidth = 200;
  float rectHeight = 50;
  textSize(14);
  for(Product p:products)
  {
    fill(255);
    rect(x, y, rectWidth, rectHeight);
    fill(0);
    text(p.name, x+10, y+30);
    text("€"+ nf(p.price, 0, 2), x+150, y+30);
    y += 75;
  }
}