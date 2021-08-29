namespace HTMLPreviewer.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public class HTML
    {
        public HTML()
        {
            this.Versions = new List<HTMLVersion>();
        }

        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(5 * 1024 * 1024)]
        public string Content { get; set; }

        public DateTime CreatedOn { get; set; }

        public DateTime ModifiedOn { get; set; }

        public ICollection<HTMLVersion> Versions { get; set; }
    }
}
