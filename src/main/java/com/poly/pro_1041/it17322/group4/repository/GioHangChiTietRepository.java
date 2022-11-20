/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.poly.pro_1041.it17322.group4.repository;

import com.poly.pro_1041.it17322.group4.config.HibernateUtil;
import com.poly.pro_1041.it17322.group4.domainmodel.ChiTietSanPham;
import com.poly.pro_1041.it17322.group4.domainmodel.GioHang;
import com.poly.pro_1041.it17322.group4.domainmodel.GioHangChiTiet;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author Lenovo
 */
public class GioHangChiTietRepository {
    private String fromTable = "FROM GioHangChiTiet";

    private Session session = HibernateUtil.getFACTORY().openSession();

    public List<GioHangChiTiet> getAll() {
        Query query = session.createQuery(fromTable, GioHangChiTiet.class);
        List<GioHangChiTiet> listGioHangChiTiet = query.getResultList(); // List category
        return listGioHangChiTiet;
    }

    public GioHangChiTiet getOne(Long id) {
        String sql = fromTable + "WHERE id =: id";
        Query query = session.createQuery(sql, GioHangChiTiet.class);
        query.setParameter("id", id);
        GioHangChiTiet gioHangChiTiet =    (GioHangChiTiet) query.getSingleResult();
        return gioHangChiTiet;
    }
    
    public Boolean add(GioHangChiTiet gioHangChiTiet){
        Transaction transaction = null;
        try(Session session = HibernateUtil.getFACTORY().openSession()){
            transaction = (Transaction) session.beginTransaction();
            session.save(gioHangChiTiet); //add
            transaction.commit();
            return true; 
        }catch (Exception e){
            e.printStackTrace(System.out);
        }
        return null;
    }
    
    public Boolean update(GioHangChiTiet gioHangChiTiet){
        Transaction transaction = null;
        try(Session session = HibernateUtil.getFACTORY().openSession()){
            transaction = (Transaction) session.beginTransaction();
            session.saveOrUpdate(gioHangChiTiet); //add
            transaction.commit();
            return true; 
        }catch (Exception e){
            e.printStackTrace(System.out);
        }
        return null;
    }
    
    public Boolean delete(GioHangChiTiet gioHangChiTiet){
        Transaction transaction = null;
        try(Session session = HibernateUtil.getFACTORY().openSession()){
            transaction = (Transaction) session.beginTransaction();
            session.delete(gioHangChiTiet); 
            transaction.commit();
            return true; 
        }catch (Exception e){
            e.printStackTrace(System.out);
        }
        return null;
    }

    public static void main(String[] args) {
        
//        List<GioHangChiTiet> lists = new GioHangChiTietRepository().getAll();
//        for (GioHangChiTiet x : lists) {
//            System.out.println(x.toString());
//        }
            ChiTietSanPham chiTietSP = null;
            GioHang gioHangSP = null;
            new GioHangChiTietRepository().add(new GioHangChiTiet(chiTietSP,gioHangSP,"HiHi","Red","DoChoi","GiaDinh","To","Nhua",10,"1000000"));
        
    }
}
