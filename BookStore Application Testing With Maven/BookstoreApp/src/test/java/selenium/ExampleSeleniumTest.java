package selenium;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.*;


import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.safari.SafariDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.support.ui.Select;


class ExampleSeleniumTest {

  static Process server;
  private WebDriver driver;

  @BeforeAll
  public static void setUpBeforeClass() throws Exception {
    ProcessBuilder pb = new ProcessBuilder("java", "-jar", "bookstore5.jar");
    server = pb.start();
  }

  @BeforeEach
  void setUp() {
    // Pick your browser
    // driver = new FirefoxDriver();
    // driver = new SafariDriver();
    WebDriverManager.chromedriver().setup();
    driver = new ChromeDriver();

    driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
    driver.get("http://localhost:8080/");
    // wait to make sure Selenium is done loading the page
    WebDriverWait wait = new WebDriverWait(driver, 60);
    wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("title")));
  }

  @AfterEach
  public void tearDown() {
    driver.close();
  }

  @AfterAll
  public static void tearDownAfterClass() throws Exception {
    server.destroy();
  }

  /*@Test
  void test1() {
    WebElement element = driver.findElement(By.id("title"));
    String expected = "YAMAZONE BookStore";
    String actual = element.getText();
    assertEquals(expected, actual);
  }

  @Test
  public void test2() {
    WebElement welcome = driver.findElement(By.cssSelector("p"));
    String expected = "Welcome";
    String actual = welcome.getText();
    assertEquals(expected, getWords(actual)[0]);
    WebElement langSelector = driver.findElement(By.id("locales"));
    langSelector.click();
    WebElement frSelector = driver.findElement(By.cssSelector("option:nth-child(3)"));
    frSelector.click();
    welcome = driver.findElement(By.cssSelector("p"));
    expected = "Bienvenu";
    actual = welcome.getText();
    assertEquals(expected, getWords(actual)[0]);
  }

  private String[] getWords(String s) {
    return s.split("\\s+");
  }*/
  
  @Test
  void AdminLoginTestPositive() {
    driver.get("http://localhost:8080/admin");
    WebElement username = driver.findElement(By.id("loginId"));
    username.sendKeys("admin");
    WebElement password = driver.findElement(By.id("loginPasswd"));
    password.sendKeys("password");
    WebElement loginButton = driver.findElement(By.id("loginBtn"));
    loginButton.click();
    String expected1 = "http://localhost:8080/admin";
    String current1 = driver.getCurrentUrl();
    assertEquals(expected1, current1);
    
  }
  @Test
  void AdminLoginTestNegative() {//login will not succeed with this attempt
    driver.get("http://localhost:8080/admin");
    WebElement username = driver.findElement(By.id("loginId"));
    username.sendKeys("wrong");
    WebElement password = driver.findElement(By.id("loginPasswd"));
    password.sendKeys("info");
    WebElement loginButton = driver.findElement(By.id("loginBtn"));
    loginButton.click();
    String expected1 = "http://localhost:8080/login?error";
    String current1 = driver.getCurrentUrl();
    assertEquals(expected1, current1);
    
  }
  @Test
  void AddBookTestPositive() { //Address positive outcomes of inputting book
    //Add book test method for this program is not perfect as we cannot 100% guarantee the book is added without seeing the list on its own
    driver.get("http://localhost:8080/admin");
    WebElement username = driver.findElement(By.id("loginId"));
    username.sendKeys("admin");
    WebElement password = driver.findElement(By.id("loginPasswd"));
    password.sendKeys("password");
    WebElement loginButton = driver.findElement(By.id("loginBtn"));
    loginButton.click();
    WebElement addBookCategory = driver.findElement(By.id("addBook-category"));
    addBookCategory.sendKeys("Comedy");
    WebElement addBookId = driver.findElement(By.id("addBook-id"));
    addBookId.sendKeys("12345");
    WebElement addBookTitle = driver.findElement(By.id("addBook-title"));
    addBookTitle.sendKeys("A Book");
    WebElement cost = driver.findElement(By.id("cost"));
    cost.sendKeys("10.99");
    WebElement addBookButton = driver.findElement(By.name("addBook"));
    addBookButton.click();
    String expected2 = "http://localhost:8080/admin";
    String current2 = driver.getCurrentUrl();
    assertEquals(expected2, current2);
    
  }
  @Test
  void AddBookTestNegative() { //Address negative outcomes of inputting book
    driver.get("http://localhost:8080/admin");
    WebElement username = driver.findElement(By.id("loginId"));
    username.sendKeys("admin");
    WebElement password = driver.findElement(By.id("loginPasswd"));
    password.sendKeys("password");
    WebElement loginButton = driver.findElement(By.id("loginBtn"));
    loginButton.click();
    WebElement addBookCategory = driver.findElement(By.id("addBook-category"));
    addBookCategory.sendKeys("");//category is blank, no book will be added
    WebElement addBookId = driver.findElement(By.id("addBook-id"));
    addBookId.sendKeys("12345");
    WebElement addBookTitle = driver.findElement(By.id("addBook-title"));
    addBookTitle.sendKeys("A Book");
    WebElement cost = driver.findElement(By.id("cost"));
    cost.sendKeys("10.99");
    WebElement addBookButton = driver.findElement(By.name("addBook"));
    addBookButton.click();
    String expected2 = "http://localhost:8080/admin";
    String current2 = driver.getCurrentUrl();
    assertEquals(expected2, current2);
    
  }
    @Test
  void CatalogBlankTest() {//catalog search testing - test for blank catalog input
    driver.get("http://localhost:8080");
    WebElement catalogue = driver.findElement(By.id("search"));
    catalogue.sendKeys("");
    WebElement searchButton = driver.findElement(By.id("searchBtn"));
    searchButton.click();
    String expected1 = "Marty Hall and Larry Brown";
    WebElement currentcat = driver.findElement(By.id("authors-hall001"));
    String current1 = currentcat.getText();
    assertEquals(expected1, current1);
    
  }
    @Test
  void CatalogTestNegative() {//catalog search testing - test for catalog input where no book exists
    driver.get("http://localhost:8080");
    WebElement catalogue = driver.findElement(By.id("search"));
    catalogue.sendKeys("Comedy");
    WebElement searchButton = driver.findElement(By.id("searchBtn"));
    searchButton.click();
    String expected1 = "http://localhost:8080/catalog";
    String current1 = driver.getCurrentUrl();
    assertEquals(expected1, current1);
    
  }
    @Test
  void AddToCartTest() {//testing add to cart and the check order
    driver.get("http://localhost:8080");
    WebElement catalogue = driver.findElement(By.id("search"));
    catalogue.sendKeys("");
    WebElement searchButton = driver.findElement(By.id("searchBtn"));
    searchButton.click();
    WebElement orderButton = driver.findElement(By.id("order-hall001")); //Specific order button for book with id hall001
    orderButton.click(); //next we go to the cart
    WebElement cartButton = driver.findElement(By.id("cartLink")); 
    cartButton.click(); 
    String expected1 = "http://localhost:8080/orderPage";
    String current1 = driver.getCurrentUrl();
    assertEquals(expected1, current1);
    
  }
    @Test
  void PositiveIncTest() {//testing incrementing item in cart
    driver.get("http://localhost:8080");
    WebElement catalogue = driver.findElement(By.id("search"));
    catalogue.sendKeys("");
    WebElement searchButton = driver.findElement(By.id("searchBtn"));
    searchButton.click();
    WebElement orderButton = driver.findElement(By.id("order-hall001")); //Specific order button for book with id hall001
    orderButton.click(); //next we go to the cart
    WebElement cartButton = driver.findElement(By.id("cartLink")); 
    cartButton.click(); 
    WebElement inc = driver.findElement(By.id("hall001"));
    inc.sendKeys("2");//change from 1 to 12
    WebElement update = driver.findElement(By.name("updateOrder")); 
    update.click();
    String expected1 = "$479.40";
    WebElement currentcost = driver.findElement(By.id("tothall001"));
    String current1 = currentcost.getText();
    assertEquals(expected1, current1);
    
  }
    @Test
  void NegativeIncTest() {//testing incrementing item in cart for 0
    JavascriptExecutor jsExec = (JavascriptExecutor)driver;
    driver.get("http://localhost:8080");
    WebElement catalogue = driver.findElement(By.id("search"));
    catalogue.sendKeys("");
    WebElement searchButton = driver.findElement(By.id("searchBtn"));
    searchButton.click();
    WebElement orderButton = driver.findElement(By.id("order-hall001")); //Specific order button for book with id hall001
    orderButton.click(); //next we go to the cart
    WebElement cartButton = driver.findElement(By.id("cartLink")); 
    cartButton.click(); 
    jsExec.executeScript("document.getElementById('hall001').setAttribute('value','0')");//change from 1 to 0
    WebElement update = driver.findElement(By.name("updateOrder")); 
    update.click();
    String expected1 = "$0.00";
    WebElement currentcost = driver.findElement(By.id("tothall001"));
    String current1 = currentcost.getText();
    assertEquals(expected1, current1);
    
  }
    @Test
  void PositiveCheckoutTest() {//checking out a book
    driver.get("http://localhost:8080");
    WebElement catalogue = driver.findElement(By.id("search"));
    catalogue.sendKeys("");
    WebElement searchButton = driver.findElement(By.id("searchBtn"));
    searchButton.click();
    WebElement orderButton = driver.findElement(By.id("order-hall001")); //Specific order button for book with id hall001
    orderButton.click(); //next we go to the cart
    WebElement cartButton = driver.findElement(By.id("cartLink")); 
    cartButton.click(); 
    WebElement checkout = driver.findElement(By.name("checkout")); 
    checkout.click();
    String expected1 = "$5.19";
    WebElement currentcost = driver.findElement(By.id("order_taxes"));
    String current1 = currentcost.getText();
    assertEquals(expected1, current1);
    
  }
@Test
  void NegativeCheckoutTest() {//checking out no books
    driver.get("http://localhost:8080");
    WebElement catalogue = driver.findElement(By.id("search"));
    catalogue.sendKeys("");
    WebElement searchButton = driver.findElement(By.id("searchBtn"));
    searchButton.click();//NO BOOK IS ADDED
    WebElement cartButton = driver.findElement(By.id("cartLink")); 
    cartButton.click(); 
    WebElement checkout = driver.findElement(By.name("checkout")); 
    checkout.click();
    String expected1 = "$0.00";
    WebElement currentcost = driver.findElement(By.id("order_taxes"));
    String current1 = currentcost.getText();
    assertEquals(expected1, current1);
    
  }
@Test
  void languageTest() {//change language
    driver.get("http://localhost:8080");
    Select lang = new Select(driver.findElement(By.id("locales")));
    lang.selectByVisibleText("French");
    String expected1 = "Librairie Y'AMAZONE";
    WebElement titleInFrench = driver.findElement(By.id("title"));
    String current1 = titleInFrench.getText();
    assertEquals(expected1, current1);
    
  }
@Test
  void RemoveBookTest() {//Remove a Book
    driver.get("http://localhost:8080/admin");
    WebElement username = driver.findElement(By.id("loginId"));
    username.sendKeys("admin");
    WebElement password = driver.findElement(By.id("loginPasswd"));
    password.sendKeys("password");
    WebElement loginButton = driver.findElement(By.id("loginBtn"));
    loginButton.click();
    WebElement searchButton = driver.findElement(By.id("searchBtn"));
    searchButton.click();
    WebElement deleteButton = driver.findElement(By.id("del-hall002"));
    deleteButton.click();
    String expected1 = "http://localhost:8080/admin/catalog";
    String current1 = driver.getCurrentUrl();
    assertEquals(expected1, current1);
    
  }
}
