﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MedicalApp.Models;
using MedicalApp.Models.OwnModels;
using System.Data.Entity;
using MedicalApp.Models.dbOwnModels;

namespace MedicalApp.Controllers
{
    public class LoginController : Controller
    {
        Encryptor crypto = new Encryptor();
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Authorize(CT_UsersCE userModel)
        {
            using (MedicalAppEntities1 db = new MedicalAppEntities1())
            {
                string EncryptedPassword = crypto.Encrypt(userModel.Password);
                
                var userDetails = db.CT_Users.Where(x => x.UserName == userModel.UserName && x.Password == EncryptedPassword).FirstOrDefault();
                if (userDetails == null)
                {

                    TempData["ShowModal"] = 1;
                    LoginModels rec = new LoginModels
                    {
                        msgColorTitle = "#e57373",
                        msgTitle = "Incorrect Credentials",
                        msgBody = "Wrong username or password."

                    };
                    ViewBag.Message = rec;


                    return View("Index", userModel);
                }
                else
                {
                    if (ModelState.IsValid)
                    {
                        //UPDATE EN LASTLOGIN DEL USUARIO Y SALVA EN DB
                        CT_Users f = db.CT_Users.SingleOrDefault(x => x.UserName == userModel.UserName);
                        f.LastLogin = DateTime.Now;
                        db.Entry(f).State = EntityState.Modified;
                        db.SaveChanges();
                        
                    }

                    var TUsers = db.CT_Users.Where(x => x.UserName == userModel.UserName).FirstOrDefault();
                    
                    Session["User"] = userDetails.UserName;
                    Session["FullUserName"] = userDetails.Name;
                    Session["PKUser"] = TUsers.id;
                    

                    return RedirectToAction("Index", "Home");


                }

            }
        }



        public ActionResult LogOut()
        {
            Session.Abandon();
            return RedirectToAction("Index", "Login");
        }


    }
}