// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package nl.bzk.brp.model.data.autaut;

import java.util.List;
import nl.bzk.brp.model.data.autaut.Toestand;
import nl.bzk.brp.model.data.autaut.ToestandDataOnDemand;
import nl.bzk.brp.model.data.autaut.ToestandIntegrationTest;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ToestandIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ToestandIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ToestandIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ToestandIntegrationTest: @Transactional;
    
    @Autowired
    private ToestandDataOnDemand ToestandIntegrationTest.dod;
    
    @Test
    public void ToestandIntegrationTest.testCountToestands() {
        Assert.assertNotNull("Data on demand for 'Toestand' failed to initialize correctly", dod.getRandomToestand());
        long count = Toestand.countToestands();
        Assert.assertTrue("Counter for 'Toestand' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ToestandIntegrationTest.testFindToestand() {
        Toestand obj = dod.getRandomToestand();
        Assert.assertNotNull("Data on demand for 'Toestand' failed to initialize correctly", obj);
        Short id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Toestand' failed to provide an identifier", id);
        obj = Toestand.findToestand(id);
        Assert.assertNotNull("Find method for 'Toestand' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Toestand' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ToestandIntegrationTest.testFindAllToestands() {
        Assert.assertNotNull("Data on demand for 'Toestand' failed to initialize correctly", dod.getRandomToestand());
        long count = Toestand.countToestands();
        Assert.assertTrue("Too expensive to perform a find all test for 'Toestand', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Toestand> result = Toestand.findAllToestands();
        Assert.assertNotNull("Find all method for 'Toestand' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Toestand' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ToestandIntegrationTest.testFindToestandEntries() {
        Assert.assertNotNull("Data on demand for 'Toestand' failed to initialize correctly", dod.getRandomToestand());
        long count = Toestand.countToestands();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Toestand> result = Toestand.findToestandEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Toestand' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Toestand' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ToestandIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Toestand' failed to initialize correctly", dod.getRandomToestand());
        Toestand obj = dod.getNewTransientToestand(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Toestand' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Toestand' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Toestand' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ToestandIntegrationTest.testRemove() {
        Toestand obj = dod.getRandomToestand();
        Assert.assertNotNull("Data on demand for 'Toestand' failed to initialize correctly", obj);
        Short id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Toestand' failed to provide an identifier", id);
        obj = Toestand.findToestand(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Toestand' with identifier '" + id + "'", Toestand.findToestand(id));
    }
    
}
