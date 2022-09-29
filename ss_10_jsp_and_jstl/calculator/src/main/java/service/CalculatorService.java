package service;

public class CalculatorService {
    public static float calculator(float firstOperand, float secondOperand, char operator){
        switch (operator){
            case '+':
                return firstOperand + secondOperand;
            case '-':
                return firstOperand - secondOperand;
            case '*':
                return firstOperand * secondOperand;
            case '/':
                if (secondOperand != 0)
                    return  firstOperand / secondOperand;
                else
                    throw new RuntimeException("Khong the chia cho 0");
            default:
                throw new RuntimeException("Khong hop le");
        }
    }

}
