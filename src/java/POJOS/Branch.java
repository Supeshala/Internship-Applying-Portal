package POJOS;
// Generated Jan 26, 2018 9:57:26 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Branch generated by hbm2java
 */
public class Branch  implements java.io.Serializable {


     private Integer idbranch;
     private String branchName;
     private Set students = new HashSet(0);

    public Branch() {
    }

    public Branch(String branchName, Set students) {
       this.branchName = branchName;
       this.students = students;
    }
   
    public Integer getIdbranch() {
        return this.idbranch;
    }
    
    public void setIdbranch(Integer idbranch) {
        this.idbranch = idbranch;
    }
    public String getBranchName() {
        return this.branchName;
    }
    
    public void setBranchName(String branchName) {
        this.branchName = branchName;
    }
    public Set getStudents() {
        return this.students;
    }
    
    public void setStudents(Set students) {
        this.students = students;
    }




}

