from db import get_connection

try:
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT GETDATE()")
    result = cursor.fetchone()

    print("✅ Connected successfully!")
    print("📅 SQL Server time:", result[0])
    conn.close()

except Exception as e:
    print("❌ Connection failed")
    print("Error:", e)
