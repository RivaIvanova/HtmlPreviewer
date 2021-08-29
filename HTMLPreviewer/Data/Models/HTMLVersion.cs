namespace HTMLPreviewer.Data.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;

    public class HTMLVersion
    {
        [Key]
        public int Id { get; set; }

        public string Content { get; set; }

        public DateTime CreatedOn { get; set; }

        public int HTMLId { get; set; }

        public HTML HTML { get; set; }
    }
}