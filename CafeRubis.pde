/*
Name: Daniel O'Connor
Student Number: C16776635
Date: 14/11/2017
Question: In today's lab test, you will be making a prototype till system for a new Dublin winebar called Cafe Rubis that's located on 9 Parliament St. 
*/

//Setup
void setup()
{
  size(800, 600);
  loadData();
  printProducts();
  background(150);
  stroke(0);
  textSize(32);
}

//Global Variables
ArrayList<Product> products = new ArrayList<Product>();
ArrayList<Product> bill = new ArrayList<Product>();

//Draw function. Displays the UI for the till system.
void draw()
{
  textSize(32);
  fill(0);
  String title = "Cafe Rubis Till System";
  text(title, width/3.5, 50);
  displayProducts();
  fill(0);
  line(width/2, 75, width/2, height - 25); 
  displayBill();
}

//Loads the contents of a .csv file into an ArrayList of type Product
void loadData()
{ 
  Table data = loadTable("cafe.csv", "header");
  for(TableRow row:data.rows())
  {
    Product p = new Product(row);
    products.add(p);
  }
}

//Prints the products for Error Handling purposes
void printProducts()
{
  for(Product p:products)
  {
    println(p.toString());
  }
}

//Display Product Function
//Displays each of the products in their own rectangle 
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

//Mouse Pressed Function
//If the user clicks on one of the products it will get added to the bill for the user
void mousePressed()
{
  float x = 25;
  float y = 75;
  float buttonHeight = 50;
  float buttonWidth = 200;
  for(Product p:products)
  {
    if(mouseX > x && mouseX < x + buttonWidth && mouseY > y && mouseY < y + buttonHeight){
      bill.add(p);
    }
    y += buttonHeight + 25;
  }
}

//Display Bill Function
//Calculates the Total for the bill. It displays every product on the bill that the user has selected followed by the bill.
void displayBill()
{
  float x = (width/2) + 25;
  float y = 75;
  float billWidth = (width - 25) - x;
  float billHeight = (height - 25) - y;
  float increment = 20;
  float total = 0;
  fill(255);
  rect(x, y, billWidth, billHeight);
  fill(0);
  y+=increment;
  text("Your Bill", x+((billWidth/2)-25), y);
  y+=increment;
  
  for(Product i:bill)
  {
    total += i.price;
  }
  
  for(Product b:bill)
  {
    text(b.name, x+10, y);
    text("€"+ nf(b.price, 0, 2), x+((billWidth)-60), y);
    y += increment;
  }
  text("Total:", x+10, y);
  text("€"+ nf(total, 0, 2), x+((billWidth)-60), y);
}