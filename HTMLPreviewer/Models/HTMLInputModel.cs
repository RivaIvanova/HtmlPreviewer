namespace HTMLPreviewer.Models
{
    using System.ComponentModel.DataAnnotations;

    public class HTMLInputModel
    {
        public int Id { get; set; }

        [Required]
        [MaxLength(5 * 1024 * 1024)]
        public string Content { get; set; }
    }
}
