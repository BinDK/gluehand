package com.mvc.entity;

import javax.persistence.*;

@Entity
@Table(name = "wallet")
public class Wallet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "money", nullable = false)
    private Double money;

    @Column(name = "money_process", nullable = false)
    private Double moneyProcess;

    @Column(name = "money_process_status", nullable = false)
    private Integer moneyProcessStatus;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getMoneyProcessStatus() {
        return moneyProcessStatus;
    }

    public void setMoneyProcessStatus(Integer moneyProcessStatus) {
        this.moneyProcessStatus = moneyProcessStatus;
    }

    public Double getMoneyProcess() {
        return moneyProcess;
    }

    public void setMoneyProcess(Double moneyProcess) {
        this.moneyProcess = moneyProcess;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}