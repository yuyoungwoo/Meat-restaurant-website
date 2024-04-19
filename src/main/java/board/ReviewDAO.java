package board;

import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {
	    public static void main(String[] args) {
	        List<Review> reviews = new ArrayList<>();

	        for (int i = 1; i <= 20; i++) {
	            String meatName = "Meat " + i;
	            int price = 1000 + i * 100;
	            String option = "Option " + i;
	            int quantity = i;

	            // 이미지 리뷰는 8개로 지정
	            boolean isPhotoReview = i <= 8;

	            Review review = new Review(meatName, price, option, quantity, isPhotoReview);
	            reviews.add(review);
	        }

	        // 리뷰 출력
	        for (Review review : reviews) {
	            System.out.println(review);
	        }
	    }
	}

	class Review {
	    private String meatName;
	    private int price;
	    private String option;
	    private int quantity;
	    private boolean isPhotoReview;

	    public Review(String meatName, int price, String option, int quantity, boolean isPhotoReview) {
	        this.meatName = meatName;
	        this.price = price;
	        this.option = option;
	        this.quantity = quantity;
	        this.isPhotoReview = isPhotoReview;
	    }

	    @Override
	    public String toString() {
	        return "Review{" +
	                "meatName='" + meatName + '\'' +
	                ", price=" + price +
	                ", option='" + option + '\'' +
	                ", quantity=" + quantity +
	                ", isPhotoReview=" + isPhotoReview +
	                '}';
	    }
	}

