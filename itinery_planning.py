from flask import Flask, render_template, request, redirect, session, jsonify
from DBConnection import Db

app = Flask(__name__)
app.secret_key="hgfgfgfghgfhgffhgfhgf"


@app.route('/')
def hello_world():
    return render_template("loginindex.html")

@app.route("/login_post", methods=['post'])
def login_post():
    username=request.form['textfield']
    password=request.form['textfield2']
    qry="SELECT * FROM login WHERE username='"+username+"' AND password='"+password+"'"
    db=Db()
    res=db.selectOne(qry)
    if(res is  None):
        return '''<script>alert('Invalid username or password');window.location='/'</script>'''
    else:

        if(res["user_type"]=="admin"):
            session["lid"] = str(res['login_id'])
            return redirect("admin_admin_home")
        elif (res["user_type"]=="tour_operator"):
            session["lid"] = str(res['login_id'])
            return redirect("tour_operator_tour_operator_home")
        else:
            return '''<script>alert('Invalid username or password');window.location='/'</script>'''


@app.route("/mailcheck")
def mailcheck():
    email=request.args.get("mail")
    db=Db()
    qry = "SELECT * FROM login WHERE username='"+email+"'"
    res = db.selectOne(qry)
    if res is None:
        return jsonify(status="ok")
    else:
        return jsonify(status="no")

@app.route("/categorycheck")
def categorycheck():
    category=request.args.get("category")
    db=Db()
    qry = "SELECT * FROM category WHERE category_name='"+category+"'"
    res = db.selectOne(qry)
    if res is None:
        return jsonify(status="ok")
    else:
        return jsonify(status="no")

@app.route("/venuecheck")
def venuecheck():
    venue=request.args.get("venue")
    db=Db()
    qry = "SELECT * FROM venues WHERE place='"+venue+"'"
    res = db.selectOne(qry)
    if res is None:
        return jsonify(status="ok")
    else:
        return jsonify(status="no")

@app.route("/adcheck")
def adcheck():
    ad=request.args.get("ad")
    db=Db()
    qry = "SELECT * FROM advertisement WHERE subject='"+ad+"'"
    res = db.selectOne(qry)
    if res is None:
        return jsonify(status="ok")
    else:
        return jsonify(status="no")

@app.route("/offercheck")
def offercheck():
    offer=request.args.get("offer")
    db=Db()
    qry = "SELECT * FROM offers WHERE offer_details='"+offer+"'"
    res = db.selectOne(qry)
    if res is None:
        return jsonify(status="ok")
    else:
        return jsonify(status="no")

@app.route("/packagecheck")
def packagecheck():
    package=request.args.get("package")
    db=Db()
    qry = "SELECT * FROM tour_packeges WHERE title='"+package+"'"
    res = db.selectOne(qry)
    if res is None:
        return jsonify(status="ok")
    else:
        return jsonify(status="no")



@app.route("/foodcheck")
def foodcheck():
    food=request.args.get("food")
    db=Db()
    qry = "SELECT * FROM food WHERE food_details='"+food+"'"
    res = db.selectOne(qry)
    if res is None:
        return jsonify(status="ok")
    else:
        return jsonify(status="no")

@app.route("/servicecheck")
def servicecheck():
    service=request.args.get("service")
    db=Db()
    qry = "SELECT * FROM other_services WHERE title='"+service+"'"
    res = db.selectOne(qry)
    if res is None:
        return jsonify(status="ok")
    else:
        return jsonify(status="no")

@app.route("/travelcheck")
def travelcheck():
    travel=request.args.get("travel")
    db=Db()
    qry = "SELECT * FROM travel WHERE places_covered='"+travel+"'"
    res = db.selectOne(qry)
    if res is None:
        return jsonify(status="ok")
    else:
        return jsonify(status="no")


@app.route("/admin_add_category")
def admin_add_category():
    return render_template("admin/Add_category.html")

@app.route("/admin_add_category_post", methods=['post'])
def admin_add_category_post():
    category_name=request.form['textfield']
    qry="INSERT INTO category(`category_name`) VALUES('"+category_name+"')"
    db=Db()
    db.insert(qry)
    return '''<script>alert('Added successfully');window.location='/admin_add_category'</script>'''




@app.route("/admin_add_venue")
def admin_add_venue():
    db = Db()
    qry = "SELECT * FROM category"
    res = db.select(qry)


    return render_template("admin/add_venue.html",data=res)

@app.route("/admin_add_venue_post", methods=['post'])
def admin_add_venue_post():
    Category=request.form['select']
    venue=request.form['textfield']
    District=request.form['textfield2']
    Description = request.form['textarea']
    latitude= request.form['textfield4']
    longitude= request.form['textfield5']
    photo1= request.files['fileField']
    photo2 = request.files['fileField2']

    p="C:\\Users\\hp\\PycharmProjects\\itinery_planning\\static\\venuephoto1\\"
    from datetime import datetime
    f=datetime.now().strftime("%Y%m%d%H%M%S")+".jpg"
    photo1.save(p+f)
    p11="/static/venuephoto1/"+f
    p1="C:\\Users\\hp\\PycharmProjects\\itinery_planning\\static\\venuephoto2\\"
    from datetime import datetime
    f1=datetime.now().strftime("%Y%m%d%H%M%S")+".jpg"
    photo2.save(p1+f1)

    p22 = "/static/venuephoto2/" + f1

    qry="INSERT INTO venues(district,description,latitude,longitude,category_id,place,photo1,photo2) values ('"+District+"','"+Description+"','"+latitude+"','"+longitude+"','"+Category+"','"+venue+"','"+p11+"','"+p22+"')"
    # qry="INSERT INTO venues('district','place','photo1','description','latitude','longitude','photo2') values ('"+District+"','"+place+"','"+photo1+"','"+Description+"','"+latitude+"','"+longitude+"','"+photo2+"')"
    db=Db()
    db.insert(qry)
    return '''<script>alert('Added successfully');window.location='/admin_add_venue'</script>'''


@app.route("/admin_approving_operator")
def admin_approving_operator():
    db=Db()
    qry="SELECT * FROM tour_operator where status='pending'"
    res=db.select(qry)
    return render_template("admin/Approving_operator.html",data=res)



@app.route("/admin_block_and_approve_operator")
def admin_block_and_approve_operator():
    db=Db()
    qry="SELECT * FROM tour_operator where status='approved'"
    res=db.select(qry)
    return render_template("admin/block_and_approve_operator.html",data=res)

@app.route('/admin_block_operator/<tid>')
def admin_block_operator(tid):
    db=Db()
    qry="update tour_operator set status='blocked' where login_id='"+tid+"'"
    res=db.update(qry)
    return redirect('/view_blocked_operator')

@app.route('/view_blocked_operator')
def view_blocked_operator():
    db=Db()
    qry="select * from tour_operator where status='blocked'"
    res=db.select(qry)
    return render_template("admin/blocked_operator.html", data=res)


@app.route("/admin_edit_venue/<vid>")
def admin_edit_venue(vid):
    qry="SELECT * FROM `venues` WHERE `venue_id`='"+vid+"' "
    db=Db()
    res=db.selectOne(qry)

    qry2 = "SELECT * FROM category"
    res2 = db.select(qry2)

    return render_template("admin/edit__venue.html",data=res,data1=res2)

@app.route("/admin_edit_venue_post" , methods=['post'])
def admin_edit_venue_post():
    Category=request.form['select']
    vid=request.form["vid"]
    venue=request.form['textfield']
    District=request.form['textfield2']
    Description = request.form['textarea']
    latitude= request.form['textfield4']
    longitude= request.form['textfield5']

    if 'fileField' in request.files and 'fileField2' in request.files:

        photo1 = request.files['fileField']
        photo2 = request.files['fileField2']
        if photo1.filename !="" and photo2.filename !="":
            p = "C:\\Users\\hp\\PycharmProjects\\itinery_planning\\static\\venuephoto1\\"
            from datetime import datetime
            f = datetime.now().strftime("%Y%m%d%H%M%S") + ".jpg"
            photo1.save(p + f)
            p11 = "/static/venuephoto1/" + f
            p1 = "C:\\Users\\hp\\PycharmProjects\\itinery_planning\\static\\venuephoto2\\"
            from datetime import datetime
            f1 = datetime.now().strftime("%Y%m%d%H%M%S") + ".jpg"
            photo2.save(p1 + f1)

            p22 = "/static/venuephoto2/" + f1
            qry="UPDATE `venues` SET `category_id`='"+Category+"',`district`='"+District+"',`place`='"+venue+"',`description`='"+Description+"',`latitude`='"+latitude+"',`longitude`='"+longitude+"',`photo1`='"+p11+"',`photo2`='"+p22+"' WHERE `venue_id`='"+vid+"'"
        elif photo1.filename !="" :
            photo1 = request.files['fileField']

            p = "C:\\Users\\hp\\PycharmProjects\\itinery_planning\\static\\venuephoto1\\"
            from datetime import datetime
            f = datetime.now().strftime("%Y%m%d%H%M%S") + ".jpg"
            photo1.save(p + f)
            p11 = "/static/venuephoto1/" + f
            print(p11)
            qry = "UPDATE `venues` SET `category_id`='" + Category + "',`district`='" + District + "',`place`='" + venue + "',`description`='" + Description + "',`latitude`='" + latitude + "',`longitude`='" + longitude + "',`photo1`='" + p11 + "' WHERE `venue_id`='" + vid + "'"
        elif photo2.filename != "":
            print("npoooo")
            photo2 = request.files['fileField2']

            p = "C:\\Users\\hp\\PycharmProjects\\itinery_planning\\static\\venuephoto2\\"
            from datetime import datetime
            f = datetime.now().strftime("%Y%m%d%H%M%S") + ".jpg"
            photo2.save(p + f)
            p22 = "/static/venuephoto2/" + f
            qry = "UPDATE `venues` SET `category_id`='" + Category + "',`district`='" + District + "',`place`='" + venue + "',`description`='" + Description + "',`latitude`='" + latitude + "',`longitude`='" + longitude + "',`photo2`='" + p22 + "' WHERE `venue_id`='" + vid + "'"
        else:
            qry = "UPDATE `venues` SET `category_id`='" + Category + "',`district`='" + District + "',`place`='" + venue + "',`description`='" + Description + "',`latitude`='" + latitude + "',`longitude`='" + longitude + "' WHERE `venue_id`='" + vid + "'"

    else:
        qry = "UPDATE `venues` SET `category_id`='" + Category + "',`district`='" + District + "',`place`='" + venue + "',`description`='" + Description + "',`latitude`='" + latitude + "',`longitude`='" + longitude + "' WHERE `venue_id`='" + vid + "'"

    db=Db()
    db.update(qry)
    return redirect("/admin_view_venue")


@app.route("/admin_feedback")
def admin_feedback():
    db=Db()
    qry="SELECT feedback.*, user.* FROM feedback JOIN USER ON user.login_id=feedback.user_id"
    res=db.select(qry)
    return render_template("admin/feedback.html", data=res)

@app.route("/admin_rating")
def admin_rating():
    db=Db()
    qry="SELECT * FROM rating,user where rating.user_id=user.login_id"
    res=db.select(qry)
    return render_template("admin/rating.html",data=res)

@app.route("/admin_update_category/<cid>")
def admin_update_category(cid):
    db=Db()
    qry="SELECT * FROM `category` WHERE `category_id`='"+cid+"'"
    res=db.selectOne(qry)
    return render_template("admin/update_category.html",data=res)
@app.route("/admin_update_category_post" , methods=['post'])
def admin_update_category_post():
    category_name = request.form['textfield']
    cid = request.form['cid']
    qry="UPDATE `category` SET `category_name`='"+category_name+"' WHERE `category_id`='"+cid+"'"
    db=Db()
    db.update(qry)
    return redirect('/admin_view_category')

@app.route("/admin_user")
def admin_user():
    db=Db()
    qry="SELECT * FROM user "
    res=db.select(qry)
    return render_template("admin/user.html", data=res)

@app.route("/admin_view_category")
def admin_view_category():
    db=Db()
    qry="SELECT * FROM category"
    res=db.select(qry)
    return render_template("admin/view_category.html",data=res)

@app.route("/admin_view_category_post", methods=['post'])
def admin_search_category_post():
    category_name=request.form['textfield']
    qry="SELECT * FROM `category` WHERE `category_name` LIKE '%"+category_name+"%'"
    db=Db()
    res=db.select(qry)
    return render_template("admin/view_category.html",data=res)

@app.route("/admin_view_venue")
def admin_view_venue():
    db=Db()
    qry="SELECT `venues`.*,`category`.`category_name` FROM `venues` INNER JOIN `category` ON `category`.`category_id`=`venues`.`category_id`"
    res=db.select(qry)
    return render_template("admin/view_venue.html",data=res)



@app.route("/admin_search_venue_post" ,methods=['post'])
def admin_search_venue_post():
    venue=request.form['textfield']
    qry="SELECT `venues`.*,`category`.`category_name` FROM `venues` INNER JOIN `category` ON `category`.`category_id`=`venues`.`category_id` WHERE `place` LIKE '%"+venue+"%'"
    db=Db()
    res=db.select(qry)
    return render_template("admin/view_venue.html",data=res)


@app.route("/tour_operator_add_advertisment")
def tour_operator_add_advertisment():
    return render_template("tour operator/add_advertisment.html")

@app.route("/tour_operator_add_advertisment_post" , methods=['post'])
def tour_operator_add_advertisment_post():
    subject=request.form['textfield']
    content=request.form['textarea']
    photo1=request.files['fileField']


    p="C:\\Users\\hp\\PycharmProjects\\itinery_planning\\static\\advertisement\\"
    from datetime import datetime
    f=datetime.now().strftime("%Y%m%d%H%M%S")+".jpg"
    photo1.save(p+f)
    p11="/static/advertisement/"+f
    qry="INSERT INTO advertisement(subject,content,`touroperator_id`,`date`,`image`)VALUES('"+subject+"','"+content+"','"+session["lid"]+"',curdate(),'"+p11+"')"
    db=Db()
    db.insert(qry)
    return '''<script>alert('Added successfully');window.location='/tour_operator_add_advertisment'</script>'''

@app.route("/tour_operator_edit_advertisment/<id>")
def tour_operator_edit_advertisment(id):
    qry="select * from advertisement where advertisement_id='"+id+"'"
    db=Db()
    res=db.selectOne(qry)
    return render_template("tour operator/edit_advertisment.html" ,data=res)
@app.route("/tour_operator_edit_advertisment_post" , methods=['post'])
def tour_operator_edit_advertisment_post():
    subject=request.form['textfield']
    content=request.form['textarea']
    id = request.form["id"]
    if 'fileField' in request.files:
        photo1=request.files['fileField']

        if photo1.filename !="":
            p="C:\\Users\\hp\\PycharmProjects\\itinery_planning\\static\\advertisement\\"
            from datetime import datetime
            f=datetime.now().strftime("%Y%m%d%H%M%S")+".jpg"
            photo1.save(p+f)
            p11="/static/advertisement/"+f
            qry="UPDATE `advertisement` SET `date`=CURDATE(),`subject`='"+subject+"',`content`='"+content+"',`image`='"+p11+"' WHERE `advertisement_id`='"+id+"'"
        else:
            qry = "UPDATE `advertisement` SET `date`=CURDATE(),`subject`='" + subject + "',`content`='" + content + "' WHERE `advertisement_id`='" + id + "'"

    else:
        qry = "UPDATE `advertisement` SET `date`=CURDATE(),`subject`='" + subject + "',`content`='" + content + "' WHERE `advertisement_id`='" + id + "'"

    db=Db()
    db.update(qry)
    return '''<script>alert('Updated successfully');window.location='/tour_operator_edit_advertisment'</script>'''

@app.route("/tour_operator_add_offer")
def tour_operator_add_offer():
    return render_template("tour operator/add_offer.html")

@app.route("/tour_operator_add_offer_post" ,methods=['post'])
def tour_operator_add_offer_post():
    offerdetails=request.form['textarea']
    validfrom=request.form['textfield']
    validto=request.form['textfield2']
    qry="INSERT INTO offers(valid_from,valid_to,offer_details,`created_on`,`touroperator_id`)VALUES ('"+validfrom+"','"+validto+"','"+offerdetails+"',curdate(),'"+session["lid"]+"')"
    db=Db()
    db.insert(qry)
    return '''<script>alert('Added successfully');window.location='/tour_operator_add_offer'</script>'''


@app.route('/tour_operator_edit_offer/<id>')
def tour_operator_edit_offer(id):
    qry="SELECT * FROM `offers` WHERE `offer_id`='"+id+"'"
    db=Db()
    res=db.selectOne(qry)
    return render_template("tour operator/edit_offer.html",data=res)

@app.route("/tour_operator_edit_offer_post" ,methods=['post'])
def tour_operator_edit_offer_post():
    offerdetails=request.form['textarea']
    validfrom=request.form['textfield']
    validto=request.form['textfield2']
    id = request.form["id"]
    qry=" UPDATE `offers` SET  `valid_from` ='"+validfrom+"', `valid_to`='"+validto+"', `offer_details`='"+offerdetails+"' WHERE `offer_id`='"+id+"'"

    # qry="UPDATE `offers` SET `created_on`=CURDATE() `valid_from` ='"+validfrom+"', `valid_to`='"+validto+"', `offer_details`='"+offerdetails+"' WHERE `offer_id`='"+id+"'"
    db=Db()
    res=db.update(qry)
    return redirect('/tour_operator_view_offer')

@app.route("/tour_operator_add_tour_packege")
def tour_operator_add_tour_package():
    return render_template("tour operator/add_tour_package.html")


@app.route("/tour_operator_add_tour_packege_post" , methods=['post'])
def tour_operator_add_tour_package_post():
    title=request.form['textfield']
    description=request.form['textarea']
    amount=request.form['textfield3']
    qry="INSERT INTO tour_packeges(title,description,amount,`touroperator_id`,`date`)VALUES ('"+title+"','"+description+"','"+amount+"','"+str(session["lid"])+"',curdate())"
    db=Db()
    db.insert(qry)
    return '''<script>alert('Added successfully');window.location='/tour_operator_add_tour_packege'</script>'''


@app.route("/tour_operator_edit_tour_packege/<id>")
def tour_operator_add_edit_package(id):
    qry="select * from `tour_packeges` where `tourpackeges_id`='"+id+"'"
    db=Db()
    res=db.selectOne(qry)
    return render_template("tour operator/edit_tour_package.html",data=res)


@app.route("/tour_operator_edit_tour_packege_post" , methods=['post'])
def tour_operator_edit_tour_package_post():
    title=request.form['textfield']
    description=request.form['textarea']
    amount=request.form['textfield3']
    id = request.form["id"]
    db=Db()
    qry="UPDATE tour_packeges SET title='"+title+"',description ='"+description+"',amount='"+amount+"' WHERE tourpackeges_id='"+id+"'"
    res=db.update(qry)


    return redirect('/tour_operator_view_and_edit_tour_package')


@app.route("/tour_operator_food/<pid>")
def tour_operator_food(pid):
    session["pid"]=pid
    db=Db()
    qry="SELECT * FROM food WHERE tourpackage_id='"+pid+"'"
    res=db.select(qry)
    return render_template("tour operator/food.html",data=res)
@app.route("/tour_operator_food_post" , methods=['post'])
def tour_operator_food_post():
    day=request.form['textfield']
    time=request.form['textfield2']
    fooddetails=request.form['textarea']
    qry="INSERT INTO food(day,time,food_details,tourpackage_id)VALUES('"+day+"','"+time+"','"+fooddetails+"','"+str(session["pid"])+"')"
    db=Db()
    db.insert(qry)
    return "<script>alert('Added Successfully');window.location='/tour_operator_food/"+session["pid"]+"'</script>"


@app.route('/tour_operator_delete_food/<pid>')
def tour_operator_delete_food(pid):
    db=Db()
    qry="DELETE FROM `food` WHERE `food_id`='"+pid+"'"
    res=db.delete(qry)
    return redirect('/tour_operator_view_and_edit_tour_package')
@app.route('/tour_operator_edit_food/<pid>')
def tour_operator_edit_food(pid):
    db=Db()
    qry="select * from food where food_id='"+pid+"'"
    res=db.selectOne(qry)
    return render_template("tour operator/edit_food.html",data=res)

@app.route("/tour_operator_edit_food_post" , methods=['post'])
def tour_operator_edit_food_post():
    day=request.form['textfield']
    time=request.form['textfield2']
    fooddetails=request.form['textarea']
    id = request.form["id"]
    db = Db()
    qry="UPDATE `food` SET `day`='"+day+"', `time`='"+time+"', `food_details`='"+fooddetails+"' where food_id='"+id+"'"

    res=db.update(qry)
    return "<script>alert('Edited  Successfully');window.location='/tour_operator_food/"+session["pid"]+"'</script>"



@app.route("/tour_operator_operator_account")
def tour_operator_operator_account():
    return render_template("tour operator/operator_account.html")
@app.route("/tour_operator_operator_account_post" ,methods=['post'])
def tour_operator_operator_account_post():
    name=request.form['textfield']
    phoneno= request.form['textfield2']
    email = request.form['textfield3']
    place= request.form['textfield4']
    password=request.form['textfield41']

    licence = request.files['fileField']


    p="C:\\Users\\hp\\PycharmProjects\\itinery_planning\\static\\touroperator\\"
    from datetime import datetime
    f=datetime.now().strftime("%Y%m%d%H%M%S")+".jpg"
    licence.save(p+f)
    l1="/static/touroperator/"+f

    qry="INSERT INTO login (`username`,`password`,`user_type`) VALUES ('"+email+"','"+password+"','tour_operator')"
    db=Db()
    lid=db.insert(qry)


    # licence = request.files['fileField']
    qry="INSERT INTO tour_operator(name,phone_no,email,login_id,place,licence_certificate,status)VALUES('"+name+"','"+phoneno+"','"+email+"','"+str(lid)+"','"+place+"','"+l1+"','pending')"
    db=Db()
    db.insert(qry)
    return '''<script>alert('Account created successfully');window.location='/tour_operator_operator_account'</script>'''


@app.route("/tour_operator_other_services/<pid>")
def tour_operator_other_services(pid):
    session["pid"]=pid
    db=Db()
    qry="SELECT * FROM other_services WHERE tourpackage_id='"+pid+"'"
    res=db.select(qry)
    return render_template("tour operator/other_services.html", data=res)

@app.route("/tour_operator_other_services_post" , methods=['post'])
def tour_operator_other_services_post():
    day=request.form['textfield']
    title=request.form['textfield2']
    description=request.form['textarea']
    qry="INSERT INTO other_services(day,title,description,tourpackage_id)VALUES ('"+day+"','"+title+"','"+description+"','"+str(session["pid"])+"')"
    db=Db()
    db.insert(qry)
    return"<script>alert('Added Successfully');window.location='/tour_operator_other_services/"+session["pid"]+"'</script>"

@app.route("/tour_operator_delete_other_services/<pid>")
def tour_operator_delete_other_services(pid):
    db=Db()
    qry="delete  from `other_services` where `service_id`='"+pid+"'"
    db.delete(qry)
    return redirect('/tour_operator_view_and_edit_tour_package')

@app.route('/tour_operator_edit_other_services/<pid>')
def tour_operator_edit_other_services(pid):
    db=Db()
    qry="SELECT * FROM `other_services`WHERE `service_id`='"+pid+"'"
    res=db.selectOne(qry)
    return render_template("tour operator/edit_other_services.html",data=res)

@app.route("/tour_operator_edit_other_services_post" , methods=['post'])
def tour_operator_edit_other_services_post():
    day=request.form['textfield']
    title=request.form['textfield2']
    description=request.form['textarea']
    id = request.form["id"]
    qry="UPDATE `other_services`SET `day`='"+day+"', `title`='"+title+"',`description`='"+description+"' where service_id='"+id+"'"
    db=Db()
    db.update(qry)
    return"<script>alert('edited Successfully');window.location='/tour_operator_other_services/"+session["pid"]+"'</script>"


@app.route("/tour_operator_stay/<pid>")
def tour_operator_stay(pid):
    session["pid"]=pid
    db=Db()
    qry="SELECT * FROM stay WHERE tourpackage_id='"+pid+"'"
    res=db.select(qry)
    return render_template("tour operator/stay.html",data=res)
@app.route("/tour_operator_stay_post" , methods=['post'])
def tour_operator_stay_post():
    day=request.form['textfield']
    stay= request.form['textfield2']
    place=request.form['textfield3']
    qry="INSERT INTO stay(day,stay_planned_at,place,tourpackage_id)VALUES('"+day+"','"+stay+"','"+place+"','"+str(session["pid"])+"')"
    db=Db()
    db.insert(qry)
    return "<script>alert('Added Successfully');window.location='/tour_operator_stay/"+session["pid"]+"'</script>"

@app.route('/tour_operator_delete_stay/<pid>')
def tour_operator_delete_stay(pid):
    db=Db()
    qry="delete from `stay` where `stay_id`='"+pid+"'"
    db.delete(qry)
    return redirect('/tour_operator_view_and_edit_tour_package')


@app.route('/tour_operator_edit_stay/<pid>')
def tour_operator_edit_stay(pid):
    db=Db()
    qry="SELECT * FROM `stay` WHERE `stay_id`='"+pid+"'"
    res=db.selectOne(qry)
    return render_template("tour operator/edit_stay.html",data=res)

@app.route("/tour_operator_edit_stay_post" , methods=['post'])
def tour_operator_edit_stay_post():
    day=request.form['textfield']
    stay= request.form['textfield2']
    place=request.form['textfield3']
    id = request.form["id"]
    qry="UPDATE `stay` SET `day`='"+day+"', `stay_planned_at`='"+stay+"', `place`='"+place+"' WHERE `stay_id`='"+id+"'"
    db=Db()
    db.update(qry)
    return "<script>alert('edited  Successfully');window.location='/tour_operator_stay/"+session["pid"]+"'</script>"



@app.route('/tour_operator_travel/<pid>')
def tour_operator_travel(pid):
    session["pid"]=pid
    db=Db()
    qry="SELECT * FROM travel WHERE tourpackage_id='"+pid+"'"
    res=db.select(qry)
    return render_template("tour operator/travel.html",data=res)
@app.route("/tour_operator_travel_post" , methods=['post'])
def tour_operator_travel_post():
    day=request.form['textfield']
    placescovered=request.form['textfield2']
    qry="INSERT INTO travel(day,places_covered,tourpackage_id)VALUES('"+day+"','"+placescovered+"','"+str(session["pid"])+"')"
    db=Db()
    db.insert(qry)
    return "<script>alert('Added Successfully');window.location='/tour_operator_travel/"+session["pid"]+"'</script>"

@app.route('/tour_operator_edit_travel/<pid>')
def tour_operator_edit_travel(pid):
    db=Db()
    qry="SELECT * FROM `travel` WHERE `travel_id`='"+pid+"'"
    res=db.selectOne(qry)
    return render_template("tour operator/edit_travel.html",data=res)


@app.route("/tour_operator_edit_travel_post" , methods=['post'])
def tour_operator_edit_travel_post():
    day=request.form['textfield']
    placescovered=request.form['textfield2']
    id = request.form["id"]
    qry="UPDATE `travel` SET `day`='"+day+"', `places_covered`='"+placescovered+"' WHERE `travel_id`='"+id+"'"
    db=Db()
    db.insert(qry)
    return "<script>alert('edited Successfully');window.location='/tour_operator_travel/"+session["pid"]+"'</script>"

@app.route('/tour_operator_delete_travel/<pid>')
def tour_operator_delete_travel(pid):
    db=Db()
    qry="DELETE FROM `travel` WHERE `travel_id`='"+pid+"'"
    res=db.delete(qry)
    return redirect('/tour_operator_view_and_edit_tour_package')





@app.route("/tour_operator_view_advertisement")
def tour_operator_view_advertisement():
    db=Db()
    qry="SELECT * FROM advertisement where touroperator_id='"+session['lid']+"'"
    res=db.select(qry)
    return render_template("tour operator/view_advertisement.html",data=res)

@app.route("/tour_operator_delete_add/<pid>")
def tour_operator_delete_add(pid):
    db=Db()
    qry="DELETE FROM `advertisement` WHERE `advertisement_id`='"+pid+"'"
    db.delete(qry)
    return redirect('/tour_operator_view_advertisement')


@app.route("/tour_operator_view_and_edit_tour_package")
def tour_operator_view_and_edit_tour_package():
    db=Db()
    qry="SELECT * FROM tour_packeges  where touroperator_id='"+session['lid']+"'"
    res=db.select(qry)
    return render_template("tour operator/view_and_edit_tour_package.html", data=res)

@app.route("/tour_operator_delete_package/<pid>")
def tour_operator_delete_package(pid):
    db=Db()
    qry="delete from tour_packeges where tourpackeges_id='"+pid+"'"
    res=db.delete(qry)
    return tour_operator_view_and_edit_tour_package()

@app.route("/tour_operator_view_offer")
def tour_operator_view_offer():
    db=Db()
    qry="SELECT * FROM offers"
    res=db.select(qry)
    return render_template("tour operator/view_offer.html", data=res)

@app.route("/tour_operator_delete_offer/<pid>")
def tour_operator_delete_offer(pid):
    db=Db()
    qry="delete from offers where offer_id='"+pid+"'"
    res=db.delete(qry)
    return tour_operator_view_offer()

@app.route("/tour_operator_view_review/<pid>")
def tour_operator_view_review(pid):

    db=Db()
    qry="SELECT `review`.*,`user`.* FROM `user` INNER JOIN `review` ON `review`.`user_lid`=`user`.`login_id` WHERE `tourpackage_id`='"+pid+"' "
    res=db.select(qry)
    return render_template("tour operator/view_review.html",data=res)

@app.route("/admin_admin_home")
def admin_admin_home():
    return render_template("admin/adminindex.html")

@app.route("/tour_operator_tour_operator_home")
def tour_operator_tour_operator_home():
    return render_template("tour operator/operatorindex.html")

@app.route('/admin_approve_operator/<tid>')
def admin_approve_operator(tid):
    db=Db()
    qry="update tour_operator set status='approved' where login_id='"+tid+"'"
    res=db.update(qry)
    return redirect('/view_approved_operator')

@app.route('/view_approved_operator')
def view_approved_operator():
    db=Db()
    qry="select * from tour_operator where status='approved'"
    res=db.select(qry)
    return render_template("admin/Approved_operator.html", data=res)


@app.route('/admin_reject_operator/<tid>')
def admin_reject_operator(tid):
    db=Db()
    qry="update tour_operator set status='rejected' where login_id='"+tid+"'"
    res=db.update(qry)
    return redirect('/view_rejected_operator')


@app.route('/view_rejected_operator')
def view_rejected_operator():
    db=Db()
    qry="select * from tour_operator where status='rejected'"
    res=db.select(qry)
    return render_template("admin/rejected_operator.html", data=res)





@app.route("/delete_category/<cid>")
def delete_category(cid):
    db=Db()
    qry="DELETE FROM `category` WHERE `category_id`='"+cid+"'"
    db.delete(qry)
    return redirect('/admin_view_category')

@app.route('/delete_venue/<vid>')
def delete_venue(vid):
    db=Db()
    qry="DELETE FROM `venues` WHERE `venue_id`='"+vid+"'"
    db.delete(qry)
    return redirect('/admin_view_venue')




@app.route('/editcategory')
def editcategory():
    return render_template("admin/edit_category.html")


# [a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2, 4}$ required, pattern
# [789][0-9]{9}


#===========================================Android======================================================================




@app.route('/and_login', methods=['POST'])
def and_login():
    username=request.form['username']
    password=request.form['password']
    qry="SELECT * FROM `login` WHERE `username`='"+username+"' AND `password`='"+password+"'"
    db=Db()
    res=db.selectOne(qry)
    if res is not None:
        return jsonify(status='ok',type="user",lid=res['login_id'])
    else:
        return jsonify(status="no")




@app.route("/and_signup",methods=['post'])
def and_signup():
    usernme=request.form['username']
    email=request.form['email']
    phoneno=request.form['phoneno']
    gender=request.form['gender']
    dob=request.form['dob']
    housename=request.form['housename']
    place=request.form['place']
    pincode=request.form['pincode']
    district=request.form['district']
    password=request.form['password']
    db=Db()
    qry="INSERT INTO `login`(`username`,`password`,`user_type`)VALUES('"+usernme+"','"+password+"','user')"
    res=db.insert(qry)
    qry1="INSERT INTO `user`(`user_name`,`email`,`phone_no`,`gender`,`dob`,`house_name`,`place`,`pincode`,`district`,`login_id`) VALUES('"+usernme+"','"+email+"','"+phoneno+"','"+gender+"','"+dob+"','"+housename+"','"+place+"','"+pincode+"','"+district+"','"+str(res)+"')"
    res1=db.insert(qry1)
    return jsonify(status='ok')

@app.route("/and_changepassword",methods=['post'])
def and_changepassword():
    lid=request.form['lid']
    currentpassword=request.form['currentpassword']
    newpassword=request.form['newpassword']
    confirmpassword=request.form['confirmpassword']
    qry="select * from login where password='"+currentpassword+"' and login_id='"+lid+"'"
    db=Db()
    res=db.selectOne(qry)
    if res is not None:
        if newpassword==confirmpassword:
            qry1="UPDATE `login` SET `password`='"+confirmpassword+"' WHERE `login_id`='"+lid+"'"
            res1=db.update(qry1)
            return jsonify(status='ok')
        else:
            return jsonify(status="none")
    else:
        return jsonify(status='no')


@app.route("/and_viewusersprofile",methods=['post'])
def and_viewusersprofile():
    lid=request.form["lid"]
    qry="select * from user where login_id='"+lid+"'"
    db=Db()
    res=db.selectOne(qry)
    return jsonify(status='ok', data=res)



@app.route("/and_editprofile",methods=['post'])
def and_editprofile():
    usernme = request.form['username']
    email = request.form['email']
    phoneno = request.form['phoneno']
    gender = request.form['gender']
    dob = request.form['dob']
    housename = request.form['housename']
    place = request.form['place']
    pincode = request.form['pincode']
    district = request.form['district']
    lid=request.form['lid']
    db=Db()
    qry="UPDATE `user` SET `user_name`='"+usernme+"',`email`='"+email+"', `phone_no`='"+phoneno+"',`gender`='"+gender+"',`dob`='"+dob+"',`house_name`='"+housename+"',`place`='"+place+"',`pincode`='"+pincode+"',`district`='"+district+"' WHERE `login_id`='"+lid+"'"
    res=db.update(qry)
    return jsonify(status='ok')




@app.route("/and_sendfeedback",methods=['post'])
def and_sendfeedback():
    feedback=request.form["feedback"]
    lid=request.form["lid"]
    qry="insert into feedback(feedback,user_id,date)VALUES ('"+feedback+"','"+lid+"',curdate())"
    db=Db()
    res=db.insert(qry)
    return jsonify(status='ok')

@app.route("/and_sendreview",methods=['post'])
def and_sendreview():
    review=request.form["review"]
    lid=request.form["lid"]
    qry="INSERT INTO review(review,user_lid,date)VALUES('"+review+"','"+lid+"',curdate())"
    db=Db()
    res=db.insert(qry)
    return  jsonify(status='ok')

@app.route("/and_viewadvertisment",methods=['post'])
def and_viewadvertisment():
    qry= "select * from advertisement"
    db=Db()
    res=db.select(qry)
    return jsonify(status='ok',data=res)

@app.route("/and_viewoffers",methods=['post'])
def and_viewoffers():
    qry="select * from offers"
    db=Db()
    res=db.select(qry)
    return jsonify(status='ok',data=res)

@app.route("/and_viewpackage",methods=['post'])
def and_viewpackage():
    qry="select * from tour_packeges "
    db=Db()
    res=db.select(qry)
    return jsonify(status='ok', data=res)

from treeop import  *

@app.route("/and_generateplanning")
def and_generateplanning():


    qry="delete from tree"
    db=Db()
    db.delete(qry)


    nodeid=1
    choices="100,101,102" #request.form["choices"]
    lat=float("75.11")
    #request.form["latitude"]
    long=float("72.15")
    #request.form["longitude"]

    nodeid=1
    parentnodeid=0
    level=0


    s= choices.split(",")

    while level < len(s):
        if nodeid==1:
          l=getvenuebycategoryid(s[0])
          for j in l:
              qry="SELECT `latitude`,`longitude` FROM `venues` WHERE `venue_id`='"+str(j)+"'"
              resk= db.selectOne(qry)
              lat2= float( resk['latitude'])
              lo2= float(resk['longitude'])
              dis=getdistancebetweentwocord(lat,long,lat2,lo2)
              instreenode(nodeid, j,str(dis), parentnodeid, level)
              nodeid = nodeid + 1
          level=level+1
        else :
            sm=getnodeidbylevel(level-1)
            for k in sm:
                n=s[level]
                v=getvenuebycategoryid(n)
                for l in v:
                    db=Db()
                    qry = "SELECT `latitude`,`longitude` FROM `venues` WHERE `venue_id` in (SELECT `venueid` FROM `tree` WHERE `nodeid`='"+str(k)+"')"
                    print(qry)

                    resk = db.selectOne(qry)

                    print(resk)
                    lat = float(resk['latitude'])
                    lo = float(resk['longitude'])
                    qry = "SELECT `latitude`,`longitude` FROM `venues` WHERE `venue_id`='" + str(l) + "'"
                    resk = db.selectOne(qry)
                    lat2 = float(resk['latitude'])
                    lo2 = float(resk['longitude'])
                    dis = getdistancebetweentwocord(lat, lo, lat2, lo2)
                    instreenode(nodeid,l,dis,k,level)
                    nodeid = nodeid + 1
            level=level+1

    return  jsonify(status='ok')






@app.route("/and_viewtouroperator",methods=['post'])
def and_viewtouroperator():
    qry="select * from tour_operator"
    db=Db()
    res=db.select(qry)
    return jsonify(status='ok', data=res)


@app.route("/and_viewcategory",methods=['post'])
def and_viewcategory():
    qry="select * from category"
    db=Db()
    res=db.select(qry)
    return jsonify(status='ok', data=res)


if __name__ == '__main__':
    app.run(debug=True,host="0.0.0.0",port=5000)
