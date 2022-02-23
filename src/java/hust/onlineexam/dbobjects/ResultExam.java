/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hust.onlineexam.dbobjects;

/**
 *
 * @author hongn
 */
public class ResultExam {
    private String take_exam_id;
    private String result_exam_id;
    private String ques_id;
    private int std_choice;

    public String getTake_exam_id() {
        return take_exam_id;
    }

    public void setTake_exam_id(String take_exam_id) {
        this.take_exam_id = take_exam_id;
    }

    public String getResult_exam_id() {
        return result_exam_id;
    }

    public void setResult_exam_id(String result_exam_id) {
        this.result_exam_id = result_exam_id;
    }

    public String getQues_id() {
        return ques_id;
    }

    public void setQues_id(String ques_id) {
        this.ques_id = ques_id;
    }

    public int getStd_choice() {
        return std_choice;
    }

    public void setStd_choice(int std_choice) {
        this.std_choice = std_choice;
    }
    
    
}
