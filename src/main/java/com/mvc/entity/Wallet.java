package com.mvc.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "wallet")
@Data
public class Wallet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "wallet_id", nullable = false)
    private Integer wallet_id;

    @Column(name = "money", nullable = false)
    private Double money;

    @Column(name = "money_process", nullable = false)
    private Double moneyProcess;

    @Column(name = "money_process_status", nullable = false)
    private Integer moneyProcessStatus;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @OneToMany(mappedBy = "wallet")
    private Set<History> histories = new LinkedHashSet<>();


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

}