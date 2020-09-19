using LocusnineAssignmentAPI.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Core.Objects;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Web.Http;

namespace LocusnineAssignmentAPI.Controllers
{
    public class UserController : ApiController
    {
        private LocusnineDataContext db = new LocusnineDataContext();

        // GET: api/User
        [HttpGet]
        public object GetUsers(int pageno = 1, int pagesize = 10, string search = null)
        {
            //return db.Users;
            try
            {
                var companyDetails = db.GetUsers(pageno, pagesize, search).ToList();

                return companyDetails;
            }
            catch (Exception ex)
            {
                ExceptionWrite.Log(ex, "api/user/GetUsers");
                throw ex;
            }
        }

        [HttpGet]
        public object GetUsersCount(string search = null)
        {
            //return db.Users;
            try
            {
                return db.GetUserCount(search).SingleOrDefault();
            }
            catch (Exception ex)
            {
                ExceptionWrite.Log(ex, "api/user/GetUsersCount");
                throw;
            }
        }

        // GET: api/User/5
        [HttpGet]
        public IHttpActionResult GetUserbyID(int id)
        {
            try
            {
                User user = db.Users.Find(id);
                if (user == null)
                {
                    return NotFound();
                }

                return Ok(user);
            }
            catch (Exception ex)
            {
                ExceptionWrite.Log(ex, "api/user/GetUserbyID");
                throw ex;
            }
        }

        // PUT: api/User/5
        [HttpPut]
        public IHttpActionResult UpdateUser(User user)
        {
            db.Entry(user).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException ex)
            {
                ExceptionWrite.Log(ex, "api/user/UpdateUser");
                throw ex;
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/User
        [HttpPost]
        public IHttpActionResult CreateUser(User user)
        {
            try
            {
                var sameusercount = db.Users.Where(w => w.Name.Replace(" ", "").Equals(user.Name.Trim().Replace(" ", ""))).Count();

                if (sameusercount == 0)
                {
                    user.Email = user.Name.Trim().Replace(" ", "").ToLower() + "@locusnine.com";
                }
                else
                {
                    int emailsuffux = sameusercount == 1 ? sameusercount : sameusercount + 1;
                    user.Email = user.Name.Trim().Replace(" ", "").ToLower() + (emailsuffux) + "@locusnine.com";
                }

                Random random = new Random();
                StatusEnum randomStatus = (StatusEnum)random.Next(0, 3);

                user.Status = randomStatus.ToString();

                db.Users.Add(user);
                db.SaveChanges();

                return CreatedAtRoute("DefaultApi", new { id = user.ID }, user);
            }
            catch (Exception ex)
            {
                ExceptionWrite.Log(ex, "api/user/CreateUser");
                throw ex;
            }
        }

        // DELETE: api/User/5
        [HttpDelete]
        public IHttpActionResult DeleteUser(int id)
        {
            try
            {
                User user = db.Users.Find(id);
                if (user == null)
                {
                    return NotFound();
                }

                db.Users.Remove(user);
                db.SaveChanges();

                return Ok(user);
            }
            catch (Exception ex)
            {
                ExceptionWrite.Log(ex, "api/user/DeleteUser");
                throw ex;
            }
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool UserExists(int id)
        {
            return db.Users.Count(e => e.ID == id) > 0;
        }
    }
}