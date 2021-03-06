// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package nl.bzk.brp.model.data.brm;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import nl.bzk.brp.model.data.brm.Regelimplementatiesituatie;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Regelimplementatiesituatie_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Regelimplementatiesituatie.entityManager;
    
    public static final EntityManager Regelimplementatiesituatie.entityManager() {
        EntityManager em = new Regelimplementatiesituatie().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Regelimplementatiesituatie.countRegelimplementatiesituaties() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Regelimplementatiesituatie o", Long.class).getSingleResult();
    }
    
    public static List<Regelimplementatiesituatie> Regelimplementatiesituatie.findAllRegelimplementatiesituaties() {
        return entityManager().createQuery("SELECT o FROM Regelimplementatiesituatie o", Regelimplementatiesituatie.class).getResultList();
    }
    
    public static Regelimplementatiesituatie Regelimplementatiesituatie.findRegelimplementatiesituatie(Integer id) {
        if (id == null) return null;
        return entityManager().find(Regelimplementatiesituatie.class, id);
    }
    
    public static List<Regelimplementatiesituatie> Regelimplementatiesituatie.findRegelimplementatiesituatieEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Regelimplementatiesituatie o", Regelimplementatiesituatie.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Regelimplementatiesituatie.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Regelimplementatiesituatie.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Regelimplementatiesituatie attached = Regelimplementatiesituatie.findRegelimplementatiesituatie(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Regelimplementatiesituatie.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Regelimplementatiesituatie.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Regelimplementatiesituatie Regelimplementatiesituatie.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Regelimplementatiesituatie merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
