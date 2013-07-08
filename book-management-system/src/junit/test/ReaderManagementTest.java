package junit.test;

import static org.junit.Assert.*;

import org.junit.Test;

import edu.jxsd.x3510.bean.Reader;
import edu.jxsd.x3510.dao.ReaderManagement;

public class ReaderManagementTest {

	@Test
	public void test() {
		ReaderManagement rm = new ReaderManagement();
		Reader reader = null;
		reader = rm.checkReader("¶ÅĞ¡Áú","123456");
		System.out.println(reader.getReaderName());
	}

}
