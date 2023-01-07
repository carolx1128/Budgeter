package finalProj;

import java.util.concurrent.Semaphore;

public class AddExpenditureThread extends Thread {
	public AddExpenditureThread(Double amount, Integer typeOfTransaction, String date, String description, String user, Integer userId) {
		this.amount = amount;
		this.typeOfTransaction = typeOfTransaction;
		this.date = date;
		this.description = description;
		this.userId = userId;
		
		this.user = user;
    }
	
	public void run() {
		try {
			Helper helper = new Helper();
			helper.addExpenditure(amount, typeOfTransaction, date, userId, description);
		}
		catch (InterruptedException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		finally {
			// do not perform trade if no stock is bought or sold
			
			semaphore.release(); // release semaphore (release space for other trades)
			
		}
		
	}
	private Double amount;
	private Integer typeOfTransaction;
	private String date, description, user;
	Integer userId;
	private Semaphore semaphore = new Semaphore(1);
}
