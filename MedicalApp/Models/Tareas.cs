//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Tareas
    {
        public int id { get; set; }
        public Nullable<System.DateTime> Fecha { get; set; }
        public Nullable<int> Asignador { get; set; }
        public string TituloTarea { get; set; }
        public string Descripcion { get; set; }
        public Nullable<int> Asignado { get; set; }
        public Nullable<System.DateTime> FechaLimite { get; set; }
        public Nullable<int> Vencida { get; set; }
        public Nullable<int> Terminada { get; set; }
        public Nullable<System.DateTime> FechaDeTermino { get; set; }
        public string Adjunto { get; set; }
        public string ComentarioDeCierre { get; set; }
        public string EvidenciaDeCierreAdjunto { get; set; }
    
        public virtual CT_Users CT_Users { get; set; }
        public virtual CT_Users CT_Users1 { get; set; }
    }
}