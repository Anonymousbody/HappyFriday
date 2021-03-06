package DAO;

import java.util.List;

public interface studentDAO {
    //教师讲学生移动到指定班级
    boolean move_student(int class_id,String student);

    //教师删除班级
    boolean delete_class(int class_id);

    //教师创建班级
    int create_class(int course_id,String class_name);

    //获取此课程下开设的所有班级
    List get_class(int course_id);

    //教师移除学生
    boolean remove_student(int course_id,String student);

    //学生存储课程学习进度
    void save_schedule(int course_id,int percentage,String student,String last_time);

    //获取课程学习进度
    String[] get_schedule(int course_id,String student);

    //获取此班级下的所有学生
    List get_class_students(int course_id,int class_id);

}
