/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.poly.pro_1041.it17322.group4.repository;

import com.poly.pro_1041.it17322.group4.config.HibernateUtil;
import com.poly.pro_1041.it17322.group4.domainmodel.GioHang;
import com.poly.pro_1041.it17322.group4.domainmodel.KhachHang;
import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author Lenovo
 */
public class GioHangRepository {
    private String fromTable = "FROM GioHang";

    private Session session = HibernateUtil.getFACTORY().openSession();

    public List<GioHang> getAll() {
        Query query = session.createQuery(fromTable, GioHang.class);
        List<GioHang> listGioHang = query.getResultList(); // List category
        return listGioHang;
    }

    public GioHang getOne(Long id) {
        String sql = fromTable + "WHERE id =: id";
        Query query = session.createQuery(sql, GioHang.class);
        query.setParameter("id", id);
        GioHang gioHang =    (GioHang) query.getSingleResult();
        return gioHang;
    }
    
    public Boolean add(GioHang gioHang){
        Transaction transaction = null;
        try(Session session = HibernateUtil.getFACTORY().openSession()){
            transaction = (Transaction) session.beginTransaction();
            session.save(gioHang); //add
            transaction.commit();
            return true; 
        }catch (Exception e){
            e.printStackTrace(System.out);
        }
        return null;
    }
    
    public Boolean update(GioHang gioHang){
        Transaction transaction = null;
        try(Session session = HibernateUtil.getFACTORY().openSession()){
            transaction = (Transaction) session.beginTransaction();
            session.saveOrUpdate(gioHang); //add
            transaction.commit();
            return true; 
        }catch (Exception e){
            e.printStackTrace(System.out);
        }
        return null;
    }
    
    public Boolean delete(GioHang gioHang){
        Transaction transaction = null;
        try(Session session = HibernateUtil.getFACTORY().openSession()){
            transaction = (Transaction) session.beginTransaction();
            session.delete(gioHang); 
            transaction.commit();
            return true; 
        }catch (Exception e){
            e.printStackTrace(System.out);
        }
        return null;
    }

    public static void main(String[] args) {
        
        List<GioHang> lists = new GioHangRepository().getAll();
        for (GioHang x : lists) {
            System.out.println(x.toString());
        }
        
        
    }
}
