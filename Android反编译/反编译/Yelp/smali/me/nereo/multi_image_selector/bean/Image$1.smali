.class final Lme/nereo/multi_image_selector/bean/Image$1;
.super Ljava/lang/Object;
.source "Image.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lme/nereo/multi_image_selector/bean/Image;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lme/nereo/multi_image_selector/bean/Image;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 58
    invoke-virtual {p0, p1}, Lme/nereo/multi_image_selector/bean/Image$1;->createFromParcel(Landroid/os/Parcel;)Lme/nereo/multi_image_selector/bean/Image;

    move-result-object v0

    return-object v0
.end method

.method public createFromParcel(Landroid/os/Parcel;)Lme/nereo/multi_image_selector/bean/Image;
    .locals 2
    .parameter "source"

    .prologue
    .line 60
    new-instance v0, Lme/nereo/multi_image_selector/bean/Image;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lme/nereo/multi_image_selector/bean/Image;-><init>(Landroid/os/Parcel;Lme/nereo/multi_image_selector/bean/Image$1;)V

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 58
    invoke-virtual {p0, p1}, Lme/nereo/multi_image_selector/bean/Image$1;->newArray(I)[Lme/nereo/multi_image_selector/bean/Image;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lme/nereo/multi_image_selector/bean/Image;
    .locals 1
    .parameter "size"

    .prologue
    .line 64
    new-array v0, p1, [Lme/nereo/multi_image_selector/bean/Image;

    return-object v0
.end method
