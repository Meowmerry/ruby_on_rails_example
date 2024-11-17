# เลือก Ruby เวอร์ชันที่ต้องการ
FROM ruby:3.2.2

# ติดตั้ง dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# ตั้งค่าไดเรกทอรีทำงานในคอนเทนเนอร์
WORKDIR /ruby_on_rails_api_example

# คัดลอกไฟล์ Gemfile และ Gemfile.lock ลงไปในคอนเทนเนอร์
COPY Gemfile* ./

# ติดตั้ง Gems
RUN bundle install

# คัดลอกไฟล์โปรเจกต์ทั้งหมดไปยังคอนเทนเนอร์
COPY . .

# เปิดพอร์ต 3000
EXPOSE 3000

# คำสั่งสำหรับรันเซิร์ฟเวอร์ Rails
CMD ["rails", "server", "-b", "0.0.0.0"]
