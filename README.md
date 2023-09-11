# FINAL CONSIDERATIONS
## GrpahUtils Function
We have created a utility class called GraphUtils to manage the dynamic graph calculations. This class provides three essential methods:
1. **calculateTotalQuestions()**
This method calculates and returns the total number of questions as a double. It’s essential for determining the maximum value of the progress indicator.
2. **calculateIndicatorAngle({required int answeredQuestions})**
This method calculates the angle at which the progress indicator should be positioned based on the number of questions answered. It takes an answeredQuestions parameter and returns the angle in degrees.
The calculation involves dividing the full circle (360 degrees) by the total number of questions to distribute angles evenly. It then adjusts the angle to center the progress indicator for better visualization.
3. **calculateProgressInPercentage({required int answeredQuestions})**
This method calculates the progress in percentage based on the number of questions answered. It takes an answeredQuestions parameter and returns the progress as a double.
It calculates the percentage of questions answered by dividing the number of answered questions by the total number of questions and then multiplying by 100.

## **Task Difficulty**: Moderate

The project included creating a progress indicator, with a dot indicator to track the user’s current question. While this part of the task may be seen as challenging, it’s well within reach with the right Flutter widgets and layout techniques.
In summary, the task’s difficulty level falls into the moderate range, with opportunities to enhance skills in state management and UI design. Overall, it represents a valuable learning experience for me.