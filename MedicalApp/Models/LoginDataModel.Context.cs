﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MedicalApp.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class MedicalAppEntities1 : DbContext
    {
        public MedicalAppEntities1()
            : base("name=MedicalAppEntities1")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<CT_Doctores> CT_Doctores { get; set; }
        public virtual DbSet<CT_Roles> CT_Roles { get; set; }
        public virtual DbSet<CT_Users> CT_Users { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<Tareas> Tareas { get; set; }
        public virtual DbSet<TareasProgramadas> TareasProgramadas { get; set; }
    }
}
