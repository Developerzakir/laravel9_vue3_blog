<template>
   <main class="create-post">
    <div class="container mt-3">
        <h3 class="text-center">Update Post</h3>

           <div class="success-msg" v-if="success">
                <i class="fa fa-check"></i>
                Posts Updated Successfully!
          </div>

        <div class="contact-form">
            <form @submit.prevent="submit">

            <div class="mb-3">
                <label for="title" class="form-label">Title</label>
                <input type="text" class="form-control" id="title" v-model="fields.title">
                <span class="text-danger"   v-if="errors.title">{{errors.title[0]}}</span>
            </div>

            <div class="mb-3">
                <label for="image" class="form-label">Image</label>
                <input type="file" class="form-control" id="image" @input="grabFile">
                <span class="text-danger"   v-if="errors.file">{{errors.file[0]}}</span>
            </div>

            <div class="mb-3">
                <label for="image" class="form-label">Preview Image</label><br>
                <img :src="url" alt="">
            </div>

            <label for="categories"><span>Choose a category:</span></label>
           <select class="form-select" v-model="fields.category_id" id="categories">
            <option  disabled value="">Select Category</option>
            <option 
            :value="category.id" 
            v-for="category in categories" 
            :key="category.id">{{category.name}}</option>
            </select>
            <span class="text-danger" v-if="errors.category_id">{{errors.category_id[0]}}</span>

             <div class="mb-3 mt-5">
                <label for="body" class="form-label">Body</label>
                <textarea  id="body" cols="30" rows="10" v-model="fields.body"></textarea>
                <span class="text-danger" v-if="errors.body">{{errors.body[0]}}</span>
            </div>

            <button type="submit" class="btn btn-primary">Update</button>

            </form>
        </div>
    </div>
   </main>
</template>

<script>
export default {
    props: ['slug'],
    data(){
        return{
            success: false,
            fields: {
                category_id: ''
            },
            errors: {},
            url: "",
            categories: []
        }
    },

    methods:{

        grabFile(e){
            const file = e.target.files[0];
            this.fields.file = file;
            //for preview image
            this.url = URL.createObjectURL(file);
            URL.revokeObjectURL(file);
        },

        submit(){
            const fd = new FormData();
            fd.append("title", this.fields.title);
            fd.append("category_id", this.fields.category_id);
            if (this.fields.file) {
                fd.append("file", this.fields.file);
            }
            fd.append("body", this.fields.body);

            fd.append("_method", "PUT");

            axios
                .post(`/api/posts/${this.slug}`, fd, {
                headers: {
                    "content-type": "multipart/form-data",
                },
                })
                .then((res) => {
                this.$emit("showEditSuccess");

                this.$router.push({ name: "DashboardPostsList" });
                })
                .catch((error) => {
                this.errors = error.response.data.errors;
                    if (error.response.status === 403) {
                        this.$router.push({ name: "DashboardPostsList" });
                    }
                });
      },
        
    },

    mounted(){
        axios.get('/api/categories')
        .then((response)=>{
            this.categories  =  response.data
        })
        .catch((error)=>{
            console.log(error);
        });

      axios.get('/api/posts/'+this.slug)
      .then((response)=>{
        this.fields  =  response.data.data;
        this.url = "/" + response.data.data.imagePath;
      })
      .catch((error)=>{
        if(error.response.status == 403){
            this.$router.push({ name: "DashboardPostsList" });
        }
      });
    }
}
</script>