package com.alain.app.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.PostLoad;
import javax.persistence.PostPersist;
import javax.persistence.PostRemove;
import javax.persistence.PostUpdate;
import javax.persistence.PrePersist;
import javax.persistence.PreRemove;
import javax.persistence.PreUpdate;

@Entity
public class ArcheType {

    @Id
    private String Name;

    @Column
    private String Use;

    @Column
    private String Desc;
    
    @PrePersist
    public void prePersist() {
        System.out.println("CarCallbackListener.prePersist:" + "Car to be created with car id: ");
    }

    @PostPersist
    public void postPersist() {
        System.out.println("CarCallbackListener.postPersist::" + "Car created with car id: ");
    }

    @PreRemove
    public void preRemove() {
        System.out.println("CarCallbackListener.preRemove:" + " About to delete Car: ");
    }

    @PostRemove
    public void postRemove() {
        System.out.println("CarCallbackListener.postRemove::" + " Deleted Car: ");
    }

    @PreUpdate
    public void preUpdate() {
        System.out.println("CarCallbackListener.preUpdate::" + " About to update Car: ");
    }

    @PostUpdate
    public void postUpdate() {
        System.out.println("CarCallbackListener.postUpdate::" + " Updated Car: ");
    }

    @PostLoad
    public void postLoad() {
        System.out.println("CarCallbackListener.postLoad::" + " Loaded Car: ");
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getUse() {
        return Use;
    }

    public void setUse(String Use) {
        this.Use = Use;
    }

    public String getDesc() {
        return Desc;
    }

    public void setDesc(String Desc) {
        this.Desc = Desc;
    }

    @Override
    public String toString() {
        return "Car=[" + "id : " + id + " model : " + model + " document : " + document + " insurances : " + insurances
                + " owners : " + owners + "]";
    }
}
