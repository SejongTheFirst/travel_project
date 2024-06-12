package payment.service;

public class PayRequest {
    private String merchantUid;
    private int amount;
    private String buyerEmail;
    private String buyerName;
    private String buyerTel;
    private String buyerAddr;
    private String buyerPostcode;
    private int productId;
    private String productName;
    private int productPrice;
    private String startDate;
    private String endDate;
    private int days;
    private int guest;
    private String writerId;
    private String imageUrl;
    private String location;
    private String paymentMethod;

    public PayRequest(String merchantUid, int amount, String buyerEmail, String buyerName, String buyerTel, String buyerAddr, String buyerPostcode, int productId, String productName, int productPrice, String startDate, String endDate, int days, int guest, String writerId, String imageUrl, String location, String paymentMethod) {
        this.merchantUid = merchantUid;
        this.amount = amount;
        this.buyerEmail = buyerEmail;
        this.buyerName = buyerName;
        this.buyerTel = buyerTel;
        this.buyerAddr = buyerAddr;
        this.buyerPostcode = buyerPostcode;
        this.productId = productId;
        this.productName = productName;
        this.productPrice = productPrice;
        this.startDate = startDate;
        this.endDate = endDate;
        this.days = days;
        this.guest = guest;
        this.writerId = writerId;
        this.imageUrl = imageUrl;
        this.location = location;
        this.paymentMethod = paymentMethod;
    }

    public String getMerchantUid() {
        return merchantUid;
    }

    public int getAmount() {
        return amount;
    }

    public String getBuyerEmail() {
        return buyerEmail;
    }

    public String getBuyerName() {
        return buyerName;
    }

    public String getBuyerTel() {
        return buyerTel;
    }

    public String getBuyerAddr() {
        return buyerAddr;
    }

    public String getBuyerPostcode() {
        return buyerPostcode;
    }

    public int getProductId() {
        return productId;
    }

    public String getProductName() {
        return productName;
    }

    public int getProductPrice() {
        return productPrice;
    }

    public String getStartDate() {
        return startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public int getDays() {
        return days;
    }

    public int getGuest() {
        return guest;
    }

    public String getWriterId() {
        return writerId;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public String getLocation() {
        return location;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }
}
