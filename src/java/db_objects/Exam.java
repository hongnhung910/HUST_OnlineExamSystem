/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package db_objects;

/**
 *
 * @author hongn
 */
public class Exam {
    private String exam_id;
    private String exam_name;
    private String exam_time_start;
    private String exam_time_create;
    private String exam_duration;
    private String exam_total_question;
    private float mark_right_answer;
    private float mark_wrong_answer;
    private String exam_type;
    private String tea_id;
    private String course_id;

    public String getExam_id() {
        return exam_id;
    }

    public void setExam_id(String exam_id) {
        this.exam_id = exam_id;
    }

    public String getExam_name() {
        return exam_name;
    }

    public void setExam_name(String exam_name) {
        this.exam_name = exam_name;
    }

    public String getExam_time_start() {
        return exam_time_start;
    }

    public void setExam_time_start(String exam_time_start) {
        this.exam_time_start = exam_time_start;
    }

    public String getExam_time_create() {
        return exam_time_create;
    }

    public void setExam_time_create(String exam_time_create) {
        this.exam_time_create = exam_time_create;
    }

    public String getExam_duration() {
        return exam_duration;
    }

    public void setExam_duration(String exam_duration) {
        this.exam_duration = exam_duration;
    }

    public String getExam_total_question() {
        return exam_total_question;
    }

    public void setExam_total_question(String exam_total_question) {
        this.exam_total_question = exam_total_question;
    }

    public float getMark_right_answer() {
        return mark_right_answer;
    }

    public void setMark_right_answer(float mark_right_answer) {
        this.mark_right_answer = mark_right_answer;
    }

    public float getMark_wrong_answer() {
        return mark_wrong_answer;
    }

    public void setMark_wrong_answer(float mark_wrong_answer) {
        this.mark_wrong_answer = mark_wrong_answer;
    }

    public String getExam_type() {
        return exam_type;
    }

    public void setExam_type(String exam_type) {
        this.exam_type = exam_type;
    }

    public String getTea_id() {
        return tea_id;
    }

    public void setTea_id(String tea_id) {
        this.tea_id = tea_id;
    }

    public String getCourse_id() {
        return course_id;
    }

    public void setCourse_id(String course_id) {
        this.course_id = course_id;
    }
    
}
