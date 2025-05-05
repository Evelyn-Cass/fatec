using AvaliaCarro.Data;
using AvaliaCarro.Models;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddDbContext<AvaliaCarroContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("AvaliaCarroContext") ?? throw new InvalidOperationException("Connection string 'AvaliaCarroContext' not found.")));

// Add services to the container.
builder.Services.AddControllersWithViews();

ContextMongoDb.ConnectionString = builder.Configuration.GetSection("MongoConnection:ConnectionString").Value;
ContextMongoDb.Database = builder.Configuration.GetSection("MongoConnection:Database").Value;
ContextMongoDb.IsSSL = Convert.ToBoolean(builder.Configuration.GetSection("MongoConnection:IsSSl").Value);


var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}
app.UseRouting();

app.UseAuthorization();

app.MapStaticAssets();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}")
    .WithStaticAssets();


app.Run();
