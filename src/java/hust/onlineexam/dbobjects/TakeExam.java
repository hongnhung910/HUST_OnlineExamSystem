/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hust.onlineexam.dbobjects;

/**
 *
 * @author hongn
 */
public class TakeExam {
    private int stdID;
    private String examID;
    private String take_examID;
    private String submitTime;
    private String startTime;
    private float grade;
    private String status;

    public int getStdID() {
        return stdID;
    }

    public void setStdID(int stdID) {
        this.stdID = stdID;
    }

    public String getExamID() {
        return examID;
    }

    public void setExamID(String examID) {
        this.examID = examID;
    }

    public String getTake_examID() {
        return take_examID;
    }

    public void setTake_examID(String take_examID) {
        this.take_examID = take_examID;
    }

    

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getSubmitTime() {
        return submitTime;
    }

    public void setSubmitTime(String submitTime) {
        this.submitTime = submitTime;
    }
    
    public float getGrade() {
        return grade;
    }

    public void setGrade(float grade) {
        this.grade = grade;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
