/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hust.onlineexam.dbobjects;

/**
 *
 * @author hongn
 */
public class Question {
    private String exam_id;
    private String ques_id;
    private String ques_title;
    private String ans_choice1;
    private String ans_choice2;
    private String ans_choice3;
    private String ans_choice4;
    private String ans_correct;

    public String getExam_id() {
        return exam_id;
    }

    public void setExam_id(String exam_id) {
        this.exam_id = exam_id;
    }

    public String getQues_id() {
        return ques_id;
    }

    public void setQues_id(String ques_id) {
        this.ques_id = ques_id;
    }

    public String getQues_title() {
        return ques_title;
    }

    public void setQues_title(String ques_title) {
        this.ques_title = ques_title;
    }

    public String getAns_choice1() {
        return ans_choice1;
    }

    public void setAns_choice1(String ans_choice1) {
        this.ans_choice1 = ans_choice1;
    }

    public String getAns_choice2() {
        return ans_choice2;
    }

    public void setAns_choice2(String ans_choice2) {
        this.ans_choice2 = ans_choice2;
    }

    public String getAns_choice3() {
        return ans_choice3;
    }

    public void setAns_choice3(String ans_choice3) {
        this.ans_choice3 = ans_choice3;
    }

    public String getAns_choice4() {
        return ans_choice4;
    }

    public void setAns_choice4(String ans_choice4) {
        this.ans_choice4 = ans_choice4;
    }

    public String getAns_correct() {
        return ans_correct;
    }

    public void setAns_correct(String ans_correct) {
        this.ans_correct = ans_correct;
    }
    
}
