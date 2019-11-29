using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace MvcMySql.Models
{
    [DbConfigurationType(typeof(MySql.Data.Entity.MySqlEFConfiguration))]
    public class MyDbContext : DbContext
    {
        public MyDbContext()
            : base("MyDbContextConnectionString")
        {
            //Database.SetInitializer<MyDbContext>(new MyDbInitializer());
        }
        public DbSet<product_details> product_details { get; set; }
        public DbSet<contact_us> contact_us { get; set; }
        public DbSet<admin_details> admin_details { get; set; }
        public DbSet<service_type> service_type { get; set; }
        public DbSet<case_details> case_details { get; set; }
    }
}