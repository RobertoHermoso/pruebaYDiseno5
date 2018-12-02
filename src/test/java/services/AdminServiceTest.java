package services;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import security.Authority;
import security.UserAccount;
import security.UserAccountService;
import utilities.AbstractTest;
import domain.Actor;
import domain.Admin;
import domain.Box;
import domain.Category;
import domain.Customer;
import domain.HandyWorker;
import domain.Message;
import domain.Priority;
import domain.Warranty;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring/datasource.xml",
	"classpath:spring/config/packages.xml" })
@Transactional
public class AdminServiceTest extends AbstractTest {

    @Autowired
    private AdminService adminService;

    @Autowired
    private UserAccountService userAccountService;

    @Autowired
    private WarrantyService warrantyService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private HandyWorkerService handyWorkerService;

    @Autowired
    private ActorService actorService;

    @Autowired
    private MessageService messageService;

    @Autowired
    private BoxService boxService;

    @Test
    public void testNumberOfAdmin() {
	List<Admin> all;

	all = this.adminService.findAll();
	Assert.isTrue(all.size() == 1);
	super.authenticate(null);
    }

    @Test
    public void testSaveUserAccount() {

	UserAccount userAccount = new UserAccount();
	List<Authority> authorities = new ArrayList<>();
	Authority authority = new Authority();
	authority.setAuthority(Authority.HANDYWORKER);
	authorities.add(authority);
	userAccount.setAuthorities(authorities);
	userAccount.setIsNotLocked(true);
	userAccount.setPassword("password");
	userAccount.setUsername("usernameTestJ");

	UserAccount saved = this.userAccountService.save(userAccount);

	List<UserAccount> userAccounts = this.userAccountService.findAll();

	Assert.isTrue(userAccounts.contains(saved));
	super.authenticate(null);
    }

    @Test
    public void testSaveWarranty() {
	super.authenticate("admin");
	Warranty warranty = this.adminService.createWarranty("warrantyTest");
	Warranty saved = this.adminService.saveWarranty(warranty);

	List<Warranty> warranties = this.warrantyService.findAll();

	Assert.isTrue(warranties.contains(saved));

	super.authenticate(null);
    }

    // Warranty
    @Test
    public void testUpdateWarranty() {
	super.authenticate("admin");

	// Creamos una warranty (ya se ha comprobado que no da error en la
	// prueba anterior
	Warranty warranty = this.adminService.createWarranty("warrantyTest");
	Warranty saved = this.adminService.saveWarranty(warranty);
	List<String> laws = new ArrayList<String>();
	laws.add("law");
	List<String> terms = new ArrayList<String>();
	terms.add("term");

	this.adminService.updateWarranty(saved, "newTitle", laws, terms);

	List<Warranty> warranties = this.warrantyService.findAll();

	Assert.isTrue(warranties.contains(saved));
	Assert.isTrue(saved.getTitle().equals("newTitle"));
	Assert.isTrue(saved.getLaws().size() == 1);
	Assert.isTrue(saved.getTerms().size() == 1);
	Assert.isTrue(saved.getTerms().get(0).equals("term"));
	Assert.isTrue(saved.getLaws().get(0).equals("law"));

	super.authenticate(null);
    }

    @Test
    public void testWarrantyToFinalMode() {
	super.authenticate("admin");
	// Creamos una warranty (ya se ha comprobado que no da error en la
	// prueba anterior
	Warranty warranty = this.adminService.createWarranty("warrantyTest");
	Warranty saved = this.adminService.saveWarranty(warranty);

	this.adminService.warrantyToFinalMode(saved);

	List<Warranty> warranties = this.warrantyService.findAll();

	Assert.isTrue(warranties.contains(saved));
	Assert.isTrue(!saved.getIsDraftMode());

	super.authenticate(null);
    }

    @Test
    public void testListWarranty() {
	super.authenticate("admin");
	List<Warranty> warranties = this.adminService.listWarranty();
	Assert.isTrue(warranties.size() == 7);
	super.authenticate(null);
    }

    @Test
    public void testShowWarranties() {
	super.authenticate("admin");
	Map<String, Warranty> warranties = this.adminService.showWarranties();
	Assert.isTrue(warranties.keySet().size() == 7);
	super.authenticate(null);
    }

    @Test
    public void testDeleteWarranty() {
	super.authenticate("admin");
	Warranty warranty = this.adminService.createWarranty("warrantyTest");
	Warranty saved = this.adminService.saveWarranty(warranty);

	List<Warranty> warranties = this.warrantyService.findAll();

	Assert.isTrue(warranties.contains(saved));

	this.adminService.deleteWarranty(saved);

	warranties = this.warrantyService.findAll();

	Assert.isTrue(!warranties.contains(saved));

	super.authenticate(null);
    }

    // Category
    @Test
    public void testListCategory() {
	super.authenticate("admin");
	List<Category> categories = this.adminService.listCategory();
	Assert.isTrue(categories.size() == 4);
	super.authenticate(null);
    }

    @Test
    public void testShowCategories() {
	super.authenticate("admin");
	Map<String, Category> categories = this.adminService.showCategory();
	Assert.isTrue(categories.keySet().size() == 4);
	super.authenticate(null);
    }

    @Test
    public void testSaveCategory() { // Contains save and findAll
	super.authenticate("admin");
	List<Category> subCategories = new ArrayList<Category>();
	Category category = this.adminService.createCategory(subCategories,
		"myCategory");
	Category save = this.categoryService.save(category);

	List<Category> categories = this.categoryService.findAll();

	Assert.isTrue(categories.contains(save));
	super.authenticate(null);
    }

    @Test
    public void testDeleteCategory() {
	super.authenticate("admin");
	List<Category> subCategories = new ArrayList<Category>();
	Category category = this.adminService.createCategory(subCategories,
		"categoryTest");
	Category saved = this.categoryService.save(category);

	List<Category> categories = this.categoryService.findAll();

	Assert.isTrue(categories.contains(saved));

	this.adminService.deleteCategory(saved);

	categories = this.categoryService.findAll();

	Assert.isTrue(!categories.contains(saved));

	super.authenticate(null);
    }

    @Test
    public void testComputeStatistics() {
	this.authenticate("admin");

	Map<String, List<Float>> result = this.adminService.computeStatistics();

	List<Float> calculations1 = result.get("fixUpTaskPerUser");
	Assert.isTrue(calculations1.size() == 1);

	List<Float> calculations2 = result.get("applicationPerFixUpTask");
	Assert.isTrue(calculations2.size() == 1);

	List<Float> calculations3 = result.get("maxPricePerFixUpTask");
	Assert.isTrue(calculations3.size() == 1);

	List<Float> calculations4 = result.get("priceOferredPerApplication");
	Assert.isTrue(calculations4.size() == 1);

	this.authenticate(null);
    }

    @Test
    public void testTenPercentMoreApplicationsCustomers() {
	this.authenticate("admin");
	Map<String, List<Customer>> map = this.adminService
		.tenPercentMoreApplicationsCustomers();
	List<Customer> customers = map
		.get("customers10PercentMoreApplications");
	Assert.isTrue(customers.size() == 1);
	this.authenticate(null);
    }

    @Test
    public void testComputeStatistics2() {
	this.authenticate("admin");
	Map<String, Float> map = this.adminService.computeStatistics2();
	Float numberComplaintsPerFixUpTask = map
		.get("numberComplaintsPerFixUpTask");
	Float notesPerReferee = map.get("notesPerReferee");
	Float resultado1 = (float) 1.5714;
	Float resultado2 = (float) 0.8;

	Assert.isTrue(numberComplaintsPerFixUpTask.equals(resultado1));
	Assert.isTrue(notesPerReferee.equals(resultado2));

	this.authenticate(null);
    }

    @Test
    public void testFixUpTaskWithAComplaint() {
	this.authenticate("admin");
	Map<String, Float> m = this.adminService.fixUpTaskWithAComplain();
	Float resultadoEsperado = (float) 100.0;
	Assert.isTrue(m.get("fixUpTaskWithComplain").equals(resultadoEsperado));
	this.authenticate(null);
    }

    @Test
    public void testTop3Customer() {
	this.authenticate("admin");

	Map<String, List<Customer>> map = this.adminService.top3Customers();
	Assert.isTrue(map.get("customers10PercentMoreApplications").size() == 3);
	this.authenticate(null);
    }

    @Test
    public void testTop3HandyWorker() {
	this.authenticate("admin");

	Map<String, List<HandyWorker>> map = this.adminService
		.top3HandyWorker();
	Assert.isTrue(map.get("HandyWorkerTermsofComplainsOrdered").size() == 3);
	this.authenticate(null);
    }

    @Test
    public void testBroadcastMessage() {

	this.authenticate("davidAdmin");

	Admin admin = this.adminService.getAdminByUsername("davidAdmin");
	HandyWorker handyWorker = this.handyWorkerService
		.getHandyWorkerByUsername("PepeHW");
	List<Actor> recipients = new ArrayList<>();
	recipients.add(admin);
	recipients.add(handyWorker);

	Message message = this.messageService.create("subject", "body",
		Priority.LOW, recipients);
	Message saved = this.messageService.save(message);
	System.out.println(message);
	System.out.println(saved);

	this.adminService.broadcastMessage(saved);

	List<Actor> allActors = new ArrayList<>();
	allActors = this.actorService.findAll();

	Integer count = 0;
	for (Actor a : allActors) {
	    Box received = this.boxService.getRecievedBoxByActor(a);
	    List<Message> receivedMessages = received.getMessages();
	    for (Message m : receivedMessages)
		if (m.getBody().equals(saved.getBody())
			&& m.getSubject().equals(saved.getSubject())
			&& m.getSender().equals(saved.getSender())
			&& m.getReceivers().containsAll(saved.getReceivers()))
		    count = count + 1;

	    Box spam = this.boxService.getSpamBoxByActor(a);
	    List<Message> spamMessages = spam.getMessages();

	    for (Message m : spamMessages)
		if (m.getBody().equals(saved.getBody())
			&& m.getSubject().equals(saved.getSubject())
			&& m.getSender().equals(saved.getSender())
			&& m.getReceivers().containsAll(saved.getReceivers()))
		    count = count + 1;

	}
	Assert.isTrue(count == allActors.size());

	this.authenticate(null);
    }

    @Test
    public void testBanSuspiciousActor() {
	this.authenticate("admin");

	Actor actor = this.actorService.getActorByUsername("PepeHW");
	actor.setHasSpam(true);

	this.actorService.save(actor);

	this.adminService.banSuspiciousActor(actor);

	Assert.isTrue(!actor.getUserAccount().getIsNotLocked());

	this.authenticate(null);
    }

    @Test
    public void testUnBanSuspiciousActor() {
	this.authenticate("admin");

	Actor actor = this.actorService.getActorByUsername("PepeHW");
	actor.setHasSpam(true);

	this.actorService.save(actor);

	this.adminService.banSuspiciousActor(actor);

	Assert.isTrue(!actor.getUserAccount().getIsNotLocked());

	this.adminService.unBanSuspiciousActor(actor);

	Assert.isTrue(actor.getUserAccount().getIsNotLocked());

	this.authenticate(null);
    }
}
