
package domain;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.Valid;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Access(AccessType.PROPERTY)
public class FixUpTask extends DomainEntity {

	private String					ticker;
	private Date					momentPublished;
	private String					description;
	private String					address;
	private double					maxPrice;
	private Date					realizationTime;

	private Collection<Application>	applications;
	private Collection<Category>	categories;
	private Collection<Phase>		phases;
	private Collection<Warranty>	warranties;
	private Collection<Complaint>	complaints;		//opt


	@NotBlank
	@Pattern(regexp = "[0-9]{2}[0-1]{1}[0-9]{3}-([A-Za-z0-9]{6})")
	@Column(unique = true)
	public String getTicker() {
		return this.ticker;
	}

	public void setTicker(final String ticker) {
		this.ticker = ticker;
	}

	@NotNull
	@Temporal(TemporalType.TIMESTAMP)
	public Date getMomentPublished() {
		return this.momentPublished;
	}

	public void setMomentPublished(final Date momentPublished) {
		this.momentPublished = momentPublished;
	}

	@NotBlank
	public String getDescription() {
		return this.description;
	}

	public void setDescription(final String description) {
		this.description = description;
	}

	@NotBlank
	public String getAddress() {
		return this.address;
	}

	public void setAddress(final String address) {
		this.address = address;
	}

	@NotNull
	@Min(0)
	@Digits(fraction = 2, integer = 9)
	public double getMaxPrice() {
		return this.maxPrice;
	}

	public void setMaxPrice(final double maxPrice) {
		this.maxPrice = maxPrice;
	}

	@NotNull
	@Temporal(TemporalType.TIMESTAMP)
	public Date getRealizationTime() {
		return this.realizationTime;
	}

	public void setRealizationTime(final Date realizationTime) {
		this.realizationTime = realizationTime;
	}

	@OneToMany(mappedBy = "fixUpTask")
	public Collection<Application> getApplications() {
		return this.applications;
	}

	public void setApplications(final Collection<Application> applications) {
		this.applications = applications;
	}

	@NotNull
	@ManyToMany
	public Collection<Category> getCategories() {
		return this.categories;
	}

	public void setCategories(final Collection<Category> categories) {
		this.categories = categories;
	}

	@Valid
	@OneToMany(cascade = CascadeType.ALL)
	public Collection<Phase> getPhases() {
		return this.phases;
	}

	public void setPhases(final Collection<Phase> phases) {
		this.phases = phases;
	}

	@NotNull
	@OneToMany
	public Collection<Warranty> getWarranties() {
		return this.warranties;
	}

	public void setWarranties(final Collection<Warranty> warranties) {
		this.warranties = warranties;
	}

	@Valid
	@OneToMany(cascade = CascadeType.ALL)
	public Collection<Complaint> getComplaints() {
		return this.complaints;
	}

	public void setComplaints(final Collection<Complaint> complaints) {
		this.complaints = complaints;
	}

}
