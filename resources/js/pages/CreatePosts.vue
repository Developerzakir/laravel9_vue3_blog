<template>
   <main class="create-post">
    <div class="container mt-3">
        <h3 class="text-center">Create Posts</h3>

           <div class="success-msg" v-if="success">
                <i class="fa fa-check"></i>
                Posts Created Successfully!
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

            <button type="submit" class="btn btn-primary">Save</button>

            </form>
        </div>
    </div>
   </main>
</template>

<script>
export default {
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
            axios
        .post("/api/posts", this.fields, {
            headers: { "content-type": "multipart/form-data" },
        })

        .then(() => {
          this.fields = {};
          this.url = null;
          this.fields.category_id = "";
          this.success = true;
          this.errors = {};
          setTimeout(() => {
            this.success = false;
          }, 2500);
        })
        .catch((error) => {
          this.errors = error.response.data.errors;
          this.success = false;
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
        })
    }
}
</script>