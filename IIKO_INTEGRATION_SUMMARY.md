# 🎯 iiko POS Integration - Complete Implementation

## ✅ What Has Been Created

### 1. **Backend Server** (`server/`)
- `server.js` - Main Express server with iiko API integration
- `package.json` - Dependencies and scripts
- `.env.example` - Environment variables template
- `start-server.bat` - Quick start script for Windows
- `README.md` - Server documentation

### 2. **Frontend Integration** 
- `iiko-integration.js` - Client-side integration module
- Updated `checkout.html` - Now sends orders to iiko

### 3. **Database Setup**
- `iiko-database-setup.sql` - SQL script to add iiko columns

### 4. **Documentation**
- `IIKO_SETUP_GUIDE.md` - Complete setup instructions
- This file - Quick reference

---

## 🚀 Quick Setup Steps

### Step 1: Get iiko Credentials
Contact iiko support (support@iiko.com) to get:
- Organization ID
- API Login
- API Key
- Terminal ID
- API URL

### Step 2: Setup Database
1. Open Supabase SQL Editor
2. Run `iiko-database-setup.sql`

### Step 3: Configure Server
```powershell
cd server
npm install
copy .env.example .env
# Edit .env with your credentials
```

### Step 4: Start Server
```powershell
.\start-server.bat
```

Or:
```powershell
npm start
```

### Step 5: Test Connection
Open browser: `http://localhost:3000/api/iiko/test`

Should see: `{"success": true, "message": "Successfully connected to iiko API"}`

### Step 6: Test Order
1. Go to your website
2. Add items to cart
3. Proceed to checkout
4. Fill in details and place order
5. Check iiko POS terminal for order

---

## 📁 File Structure

```
AlSaraya/
├── server/                    # Backend server
│   ├── server.js             # Main server file
│   ├── package.json          # Dependencies
│   ├── .env.example          # Config template
│   ├── .env                  # Your credentials (create this)
│   ├── start-server.bat      # Windows start script
│   └── README.md             # Server docs
│
├── iiko-integration.js       # Frontend integration
├── iiko-database-setup.sql   # Database schema
├── IIKO_SETUP_GUIDE.md      # Full setup guide
└── checkout.html             # Updated checkout page
```

---

## 🔧 How It Works

### Order Flow:

1. **Customer places order** on website
2. **Frontend** collects order data
3. **Order saved** to Supabase database
4. **Backend server** receives order data
5. **Server authenticates** with iiko API
6. **Order formatted** for iiko format
7. **Order sent** to iiko POS
8. **iiko POS receives** order and displays to staff
9. **Order ID** saved back to database
10. **Customer receives** confirmation

### Error Handling:

- If iiko sync fails, order still completes
- Customer still gets confirmation
- Staff notified to manually add order
- Failed orders tracked in database
- Can retry sync later from admin panel

---

## 🎨 Features

✅ **Automatic Order Sync** - Orders appear instantly in POS
✅ **Customer Information** - Name, phone, email transferred
✅ **Delivery Details** - Address and notes included
✅ **Order Items** - Products with quantities and prices
✅ **Payment Method** - Cash/Card tracking
✅ **Error Handling** - Graceful fallback if sync fails
✅ **Sync Status Tracking** - Monitor which orders synced
✅ **Retry Failed Orders** - Can re-attempt failed syncs
✅ **Product Mapping** - Match website products to iiko menu

---

## 🔍 Monitoring

### Check Sync Status:
```sql
SELECT 
    iiko_sync_status,
    COUNT(*) as count
FROM orders
GROUP BY iiko_sync_status;
```

### View Failed Orders:
```sql
SELECT * FROM orders_iiko_failed;
```

### View Pending Orders:
```sql
SELECT * FROM orders_iiko_pending;
```

### Retry Failed Order:
```sql
SELECT retry_failed_iiko_sync(123); -- Replace 123 with order ID
```

---

## 🆘 Troubleshooting

### Problem: Server won't start
**Check:**
- Node.js installed? `node --version`
- Dependencies installed? `npm install`
- .env file created?
- Port 3000 available?

### Problem: "Authentication failed"
**Check:**
- Correct API credentials in .env
- API access enabled by iiko
- Internet connection working

### Problem: Order not in iiko
**Check:**
- Server running? `http://localhost:3000/api/health`
- Terminal ID correct?
- Product IDs mapped?
- Check server logs for errors

### Problem: Product ID errors
**Solution:**
Add iiko_product_id to products table:
```sql
UPDATE products 
SET iiko_product_id = 'actual-iiko-id' 
WHERE id = 1;
```

---

## 📞 Support

**iiko Support:**
- Email: support@iiko.com
- Website: https://www.iiko.com/

**Documentation:**
- API Docs: https://api-ru.iiko.services/
- Setup Guide: IIKO_SETUP_GUIDE.md
- Server README: server/README.md

---

## 🔐 Security Checklist

- [ ] .env file not in Git
- [ ] Use HTTPS in production
- [ ] Secure API keys
- [ ] Enable CORS only for your domain
- [ ] Use environment variables
- [ ] Monitor API usage
- [ ] Rotate keys periodically
- [ ] Implement rate limiting
- [ ] Add request validation
- [ ] Set up error alerting

---

## 📈 Next Steps

1. **Get iiko credentials** from iiko support
2. **Run database setup** SQL script
3. **Configure backend** server with credentials
4. **Test connection** to iiko API
5. **Map products** to iiko menu items
6. **Test order flow** end-to-end
7. **Deploy server** to production
8. **Update frontend** with production URL
9. **Train staff** on new system
10. **Go live!** 🎉

---

## 💡 Tips

- Start with test mode if available
- Map a few products first to test
- Monitor closely for first few days
- Have backup process ready
- Keep iiko support contact handy
- Document any custom changes
- Regular backup of configurations

---

## 📝 Notes

- Orders sync in real-time (< 1 second typically)
- Failed syncs don't stop order completion
- All orders tracked in database regardless
- Staff can manually add if sync fails
- Product mapping is crucial for success
- Test thoroughly before going live

---

**Ready to integrate?** Follow IIKO_SETUP_GUIDE.md for detailed instructions!
