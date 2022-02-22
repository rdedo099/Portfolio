/**
 * The class  <b>LinearRegression</b> implements gradient
 * descent with 1 variable.
 *
 * @author gvj (gvj@eecs.uottawa.ca)
 *
 */
import java.util.ArrayList;
import java.util.Arrays;

public class LinearRegression {




 /** 
     * Number of samples (usually "m" in litterature) 
     */
 private int nbreOfSamples;


 /** 
     * the sample vector
     */
 private double[] samples;

 /** 
     * the samples target values
     */
 private double[] samplesValues;

 /** 
     * the current hypthesis function: theta0 + theta1 x
     */
 private double theta0, theta1;
   


 /** 
     * used to ensure that the object is ready
     */
 private int currentNbreOfSamples;



 /** 
     * counts how many iterations have been performed
     */
 private int iteration;


 /** 
     * Object's contructor. The constructor initializes the instance
     * variables. The starting hypthesis is y = 0;
     * 
     * 
     * @param m the number of samples that we will have
  *
     */
  public LinearRegression(int m){
    nbreOfSamples = m;
    theta0=0;
    theta1=0;
    samples=new double[m];
    samplesValues=new double[m];
    iteration = 0;
    currentNbreOfSamples=0;
      


 }

 /** 
     * Adds a new sample to sample and to samplesValues. This
     * method must be iteratively called with all the samples
     * before the gradient descent can be started
     * 
     * @param x the new sample
     * @param y the corresponding expected value
     *
  */
 public void addSample(double x, double y){
//get number of samples and input in the open spot
   samples[currentNbreOfSamples]=x;
   samplesValues[currentNbreOfSamples]=y;
   currentNbreOfSamples++;
 }

 /** 
     * Returns the current hypothesis for the value of the input
     * @param x the input for which we want the current hypothesis
     * 
  * @return theta0 + theta1 x
  */
 private double hypothesis(double x){
  return theta0+(theta1*x);
 }

 /** 
     * Returns a string representation of hypthesis function
     * 
  * @return the string "theta0 + theta1 x"
  */
 public String currentHypothesis(){

  double theta0 = getTheta0();
  double theta1 = getTheta1();
  //CONVERT TO STRING
  return theta0+" + "+theta1+"x";
 }

 /** 
     * Returns the current cost
     * 
  * @return the current value of the cost function
  */
 public double currentCost(){
  double total = 0;
  for(int i = 0; i<nbreOfSamples; i++){
    total=(hypothesis(samples[i]-samplesValues[i])*(hypothesis(samples[i]-samplesValues[i])));
                                                   }
return (total/nbreOfSamples);
 }

 /** 
     * runs several iterations of the gradient descent algorithm
     * 
     * @param alpha the learning rate
     *
     * @param numberOfSteps how many iteration of the algorithm to run
     */
 public void gradientDescent(double alpha, int numberOfSteps) {
   double hold=0;
   double hold2=0;
   
   
   for(int x=0; x<numberOfSteps;x++){
     hold=0;
     hold2=0;
     for (int i=0; i<nbreOfSamples; i++){
       hold=hold+(alpha*2/nbreOfSamples)*(hypothesis(samples[i])-samplesValues[i]);
       hold2=hold2+(alpha*2/nbreOfSamples)*((hypothesis(samples[i])-samplesValues[i])*samples[i]);
       //System.out.println(hold);
     
     } 
     theta0=theta0-hold;
     theta1=theta1-hold2;
     //System.out.println(theta1);
     iteration++;
       
   }
 }



 /** 
     * Getter for theta0
     *
  * @return theta0
  */

 public double getTheta0(){
  return theta0;
 }

 /** 
     * Getter for theta1
     *
  * @return theta1
  */

 public double getTheta1(){
  return theta1;
 }

 /** 
     * Getter for samples
     *
  * @return samples
  */

 public double[] getSamples(){
  return samples;
 }

 /** 
     * Getter for getSamplesValues
     *
  * @return getSamplesValues
  */

 public double[] getSamplesValues(){
  return samplesValues;
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