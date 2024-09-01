import { ApiTags } from "@nestjs/swagger";
import { Body, Controller, Get, NotFoundException, Param, Post, Put } from "@nestjs/common";
import { StudentsService } from "../services/students.service";
import { Alumno } from "../common/entities/students.entity";


@ApiTags('Estudiantes')
@Controller('students')

export class StudentsController {
    constructor(
        private studentService: StudentsService
    ) {
    }

    @Get('list-all')
    async listStudents () {
        return this.studentService.findAll()
    }

    @Post('create')
    async createAlumno(@Body() createAlumnoDto: any): Promise<Alumno[]> {
        return await this.studentService.create(createAlumnoDto);
    }

    @Post('delete/:id')
    async deleteStudent(@Param('id') id: number): Promise<void> {
        try {
            await this.studentService.deleteStudent(id);
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
    ): Promise<Alumno> {
        try {
            return await this.studentService.update(id, updateAlumnoDto);
        } catch (error) {
            if (error.message === 'Student not found') {
                throw new NotFoundException('Student not found');
            }
            throw error;
        }
    }


}
