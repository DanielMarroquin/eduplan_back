import { ApiTags } from "@nestjs/swagger";
import { Body, Controller, Get, NotFoundException, Param, Post, Put } from "@nestjs/common";
import { CoursesService } from "../services/courses.service";
import { Curso } from "../common/entities/courses.entity";

@ApiTags('Cursos')
@Controller('courses')

export class CoursesController {
    constructor(
        private coursesService: CoursesService
    ) {
    }

    @Get('list-all')
    async listStudents () {
        return this.coursesService.findAll()
    }


    @Post('create')
    async createAlumno(@Body() createAlumnoDto: any): Promise<Curso[]> {
        return await this.coursesService.create(createAlumnoDto);
    }


    @Post('delete/:id')
    async deleteStudent(@Param('id') id: number): Promise<void> {
        try {
            await this.coursesService.deleteCourse(id);
        } catch (error) {
            if (error.message === 'Student not found') {
                throw new NotFoundException('Student not found');
            }
            throw error;
        }
    }

    @Put('update/:id')
    async update(
        @Param('id') id: number,
        @Body() updateAlumnoDto: any
    ): Promise<Curso> {
        try {
            return await this.coursesService.update(id, updateAlumnoDto);
        } catch (error) {
            if (error.message === 'Student not found') {
                throw new NotFoundException('Student not found');
            }
            throw error;
        }
    }




}
