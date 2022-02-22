/**
 * The class  <b>LinearRegression</b> implements gradient
 * descent for multiple variables
 *
 * @author gvj (gvj@eecs.uottawa.ca)
 *
 */

public class LinearRegression{


 /** 
     * Number of features (usually "n" in litterature) 
     */
 private int nbreOfFeatures;

 /** 
     * Number of samples (usually "m" in litterature) 
     */
 private int nbreOfSamples;


 /** 
     * the nbreOfFeatures X nbreOfSamples Matrix of samples
     */
 private double[][] samplesMatrix;

 /** 
     * the nbreOfSamples Matrix of samples target values
     */
 private double[] samplesValues;

 /** 
     * the nbreOfFeatures Matrix theta of current hypthesis function
     */
 private double[] theta;


 /** 
     * number of samples received so far
     */
 private int currentNbreOfSamples;

 /** 
     * a place holder for theta during descent calculation
     */
 private double[] tempTheta;


 /** 
     * counts how many iterations have been performed
     */
 private int iteration;


 /** 
     * Object's contructor. The constructor initializes the instance
     * variables. The starting hypthesis is theta[i]=0.0 for all i
     * 
     * @param n the number of features that we will have
     * @param m the number of samples that we will have
  *
     */
  public LinearRegression(int n, int m){

    nbreOfSamples = m;
    nbreOfFeatures = n;
    theta=new double[n+1];
    samplesMatrix = new double[m][n];
    samplesValues=new double[m];
    tempTheta= new double [n+1];
    iteration = 0;
    currentNbreOfSamples=0;


 }

 /** 
     * Add a new sample to samplesMatrix and samplesValues
     * 
     * @param x the vectors of samples
     * @param y the coresponding expected value
     *
  */
 public void addSample(double[] x, double y){
   samplesValues[currentNbreOfSamples]=y;
   samplesMatrix[currentNbreOfSamples]=x;
   currentNbreOfSamples++;


 }

 /** 
     * Returns the current hypothesis for the value of the input
     * @param x the input vector for which we want the current hypothesis
     * 
  * @return h(x)
  */

 private double hypothesis(double[] x){

  double hold = 0;
  for (int i = 0; i<nbreOfFeatures;i++){
    hold=hold+(x[i]*theta[i]*(1+i));
  }
return hold;
 }

 /** 
     * Returns a string representation of hypthesis function
     * 
  * @return the string "theta0 x_0 + theta1 x_1 + .. thetan x_n"
  */

 public String currentHypothesis(){
return (theta[0]+" + "+theta[1]*2+"x_1 "+theta[2]*3+"x_2");
 }

 /** 
     * Returns the current cost
     * 
  * @return the current value of the cost function
  */

 public double currentCost(){

  double total = 0;
  for(int i = 0; i<nbreOfSamples; i++){
    total=total+((hypothesis(samplesMatrix[i])-samplesValues[i])*(hypothesis(samplesMatrix[i])-samplesValues[i]));
  }
  return total;

    

 }

 /** 
     * runs several iterations of the gradient descent algorithm
     * 
     * @param alpha the learning rate
     *
     * @param numberOfSteps how many iteration of the algorithm to run
     */

 public void gradientDescent(double alpha, int numberOfSteps) {
   for (int y=0; y<numberOfSteps;y++){
   for (int i=0; i<=nbreOfFeatures; i++){
     double sum = 0;
     for(int x=0; x<nbreOfSamples;x++){
     sum=sum+(hypothesis(samplesMatrix[x])-samplesValues[x]);
     }
     tempTheta[i]=theta[i]-(alpha*2/nbreOfSamples)*sum;
   }
   theta=tempTheta;
   }
     
     
   

 }


 /** 
     * Getter for theta
     *
  * @return theta
  */

 public double[] getTheta(){

  return theta;

 }

 /** 
     * Getter for iteration
     *
  * @return iteration
  */

 public int getIteration(){

  return iteration;

 }
}