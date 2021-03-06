// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package nl.bzk.brp.model.data.kern;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import nl.bzk.brp.model.data.kern.Verantwoordelijke;
import nl.bzk.brp.model.data.kern.VerantwoordelijkeDataOnDemand;
import org.springframework.stereotype.Component;

privileged aspect VerantwoordelijkeDataOnDemand_Roo_DataOnDemand {
    
    declare @type: VerantwoordelijkeDataOnDemand: @Component;
    
    private Random VerantwoordelijkeDataOnDemand.rnd = new SecureRandom();
    
    private List<Verantwoordelijke> VerantwoordelijkeDataOnDemand.data;
    
    public Verantwoordelijke VerantwoordelijkeDataOnDemand.getNewTransientVerantwoordelijke(int index) {
        Verantwoordelijke obj = new Verantwoordelijke();
        setCode(obj, index);
        setNaam(obj, index);
        return obj;
    }
    
    public void VerantwoordelijkeDataOnDemand.setCode(Verantwoordelijke obj, int index) {
        String code = String.valueOf(index);
        if (code.length() > 1) {
            code = new Random().nextInt(10) + code.substring(1, 1);
        }
        obj.setCode(code);
    }
    
    public void VerantwoordelijkeDataOnDemand.setNaam(Verantwoordelijke obj, int index) {
        String naam = "naam_" + index;
        if (naam.length() > 40) {
            naam = new Random().nextInt(10) + naam.substring(1, 40);
        }
        obj.setNaam(naam);
    }
    
    public Verantwoordelijke VerantwoordelijkeDataOnDemand.getSpecificVerantwoordelijke(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Verantwoordelijke obj = data.get(index);
        Short id = obj.getId();
        return Verantwoordelijke.findVerantwoordelijke(id);
    }
    
    public Verantwoordelijke VerantwoordelijkeDataOnDemand.getRandomVerantwoordelijke() {
        init();
        Verantwoordelijke obj = data.get(rnd.nextInt(data.size()));
        Short id = obj.getId();
        return Verantwoordelijke.findVerantwoordelijke(id);
    }
    
    public boolean VerantwoordelijkeDataOnDemand.modifyVerantwoordelijke(Verantwoordelijke obj) {
        return false;
    }
    
    public void VerantwoordelijkeDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Verantwoordelijke.findVerantwoordelijkeEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Verantwoordelijke' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Verantwoordelijke>();
        for (int i = 0; i < 10; i++) {
            Verantwoordelijke obj = getNewTransientVerantwoordelijke(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
