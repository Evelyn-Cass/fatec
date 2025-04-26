using PetMongodb.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using PetMongodb.Data;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddDbContext<PetMongodbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("PetMongodbContext") ?? throw new InvalidOperationException("Connection string 'PetMongodbContext' not found.")));

// Add services to the container.
builder.Services.AddControllersWithViews();

ContextMongodb.ConnectionString = builder.Configuration.GetSection("MongoConnection:ConnectionString").Value;
ContextMongodb.Database = builder.Configuration.GetSection("MongoConnection:Database").Value;
ContextMongodb.IsSSL = Convert.ToBoolean(builder.Configuration.GetSection("MongoConnection:IsSSL").Value);

builder.Services.AddIdentity<ApplicationUser, ApplicationRole>()
    .AddMongoDbStores<ApplicationUser, ApplicationRole, Guid>(
    ContextMongodb.ConnectionString, ContextMongodb.Database);
var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}
app.UseStaticFiles();

app.UseRouting();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
