
package services;

import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import repositories.EducationRecordRepository;
import domain.EducationRecord;

@Service
@Transactional
public class EducationRecordService {

	// Manged Repository

	@Autowired
	private EducationRecordRepository	educationRecordRepository;


	// Simple CRUD methods

	public EducationRecord create(String title, Date startDateStudy, Date endDateStudy, String institution, String link, List<String> comments) {

		EducationRecord educationRecord = new EducationRecord();
		educationRecord.setTitle(title);
		educationRecord.setStartDateStudy(startDateStudy);
		educationRecord.setEndDateStudy(endDateStudy);
		educationRecord.setInstitution(institution);
		educationRecord.setUrl(link);
		educationRecord.setComments(comments);

		return educationRecord;

	}

	public Collection<EducationRecord> findAll() {

		return this.educationRecordRepository.findAll();
	}
	public EducationRecord findOne(Integer id) {
		return this.educationRecordRepository.findOne(id);
	}

	public void save(EducationRecord educationRecord) {
		this.educationRecordRepository.save(educationRecord);
	}

	public void delete(EducationRecord educationRecord) {
		this.educationRecordRepository.delete(educationRecord);
	}

	public void deleteAll(List<EducationRecord> educationRecord) {
		this.educationRecordRepository.deleteInBatch(educationRecord);
	}
}
